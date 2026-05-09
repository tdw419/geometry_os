; DESCRIPTION: Creates a magenta circular shape at (404, 126) with radius 36.
; PLAN: r0=404(x), r1=126(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 126
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
