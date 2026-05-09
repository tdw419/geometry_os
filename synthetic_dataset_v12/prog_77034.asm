; DESCRIPTION: Creates a cyan rectangular region at (169, 74) spanning 36 by 118 pixels.
; PLAN: r0=169(x), r1=74(y), r2=36(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 74
LDI r2, 36
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
