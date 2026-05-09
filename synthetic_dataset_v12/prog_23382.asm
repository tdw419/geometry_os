; DESCRIPTION: Renders a blue disk with center (366, 198) and radius 42.
; PLAN: r0=366(x), r1=198(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 198
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
