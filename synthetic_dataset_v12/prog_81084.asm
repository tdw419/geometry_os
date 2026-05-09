; DESCRIPTION: Renders a red disk with center (50, 111) and radius 24.
; PLAN: r0=50(x), r1=111(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 111
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
