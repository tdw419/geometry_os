; DESCRIPTION: Creates a purple circular shape at (235, 173) with radius 50.
; PLAN: r0=235(x), r1=173(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 173
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
