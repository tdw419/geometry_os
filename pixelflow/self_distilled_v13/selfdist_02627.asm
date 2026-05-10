; DESCRIPTION: Renders a cyan rectangular region spanning 118 by 86 at (366, 142).
; PLAN: r0=366(x), r1=142(y), r2=118(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 142
LDI r2, 118
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
