; DESCRIPTION: Renders a white circular shape at (190, 176) with radius 50.
; PLAN: r0=190(x), r1=176(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 176
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
