; DESCRIPTION: Renders a cyan disk with center (113, 90) and radius 78.
; PLAN: r0=113(x), r1=90(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 90
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
