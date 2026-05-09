; DESCRIPTION: Renders a red disk with center (366, 168) and radius 64.
; PLAN: r0=366(x), r1=168(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 168
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
