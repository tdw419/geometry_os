; DESCRIPTION: Renders a orange circular shape at (20, 190) with radius 67.
; PLAN: r0=20(x), r1=190(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 20
LDI r1, 190
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
