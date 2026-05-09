; DESCRIPTION: Creates a cyan rectangular region at (118, 131) spanning 99 by 50 pixels.
; PLAN: r0=118(x), r1=131(y), r2=99(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 131
LDI r2, 99
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
