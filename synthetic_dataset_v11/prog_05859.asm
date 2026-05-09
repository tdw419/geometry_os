; DESCRIPTION: Creates a magenta circular shape at (128, 168) with radius 50.
; PLAN: r0=128(x), r1=168(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 168
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
