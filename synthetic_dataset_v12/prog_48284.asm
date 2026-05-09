; DESCRIPTION: Creates a cyan rectangular region at (6, 131) spanning 118 by 106 pixels.
; PLAN: r0=6(x), r1=131(y), r2=118(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 131
LDI r2, 118
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
