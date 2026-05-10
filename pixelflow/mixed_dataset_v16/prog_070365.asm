; DESCRIPTION: Renders a magenta disk with center (445, 74) and radius 62.
; PLAN: r0=445(x), r1=74(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 74
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
