; DESCRIPTION: Renders a orange disk with center (362, 74) and radius 72.
; PLAN: r0=362(x), r1=74(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 74
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
