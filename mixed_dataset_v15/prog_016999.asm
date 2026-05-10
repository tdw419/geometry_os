; DESCRIPTION: Creates a magenta circular shape at (308, 206) with radius 14.
; PLAN: r0=308(x), r1=206(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 206
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
