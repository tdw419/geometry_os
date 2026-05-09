; DESCRIPTION: Renders a white disk with center (146, 128) and radius 50.
; PLAN: r0=146(x), r1=128(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 128
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
