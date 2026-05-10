; DESCRIPTION: Renders a magenta circular shape at (361, 190) with radius 46.
; PLAN: r0=361(x), r1=190(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 190
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
