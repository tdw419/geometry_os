; DESCRIPTION: Renders a cyan rectangular region spanning 118 by 49 at (39, 96).
; PLAN: r0=39(x), r1=96(y), r2=118(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 96
LDI r2, 118
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
