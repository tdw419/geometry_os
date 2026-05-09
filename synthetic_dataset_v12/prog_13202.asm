; DESCRIPTION: Creates a magenta circular shape at (284, 109) with radius 68.
; PLAN: r0=284(x), r1=109(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 109
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
