; DESCRIPTION: Draws a cyan circle centered at (228, 235) with radius 10.
; PLAN: r0=228(x), r1=235(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 235
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
