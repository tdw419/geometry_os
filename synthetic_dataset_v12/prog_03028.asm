; DESCRIPTION: Renders a magenta disk with center (410, 50) and radius 39.
; PLAN: r0=410(x), r1=50(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 50
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
