; DESCRIPTION: Creates a cyan rectangular region at (118, 153) spanning 90 by 23 pixels.
; PLAN: r0=118(x), r1=153(y), r2=90(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 153
LDI r2, 90
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
