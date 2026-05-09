; DESCRIPTION: Renders a red disk with center (160, 74) and radius 50.
; PLAN: r0=160(x), r1=74(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 74
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
