; DESCRIPTION: Creates a magenta circular shape at (179, 150) with radius 50.
; PLAN: r0=179(x), r1=150(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 150
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
