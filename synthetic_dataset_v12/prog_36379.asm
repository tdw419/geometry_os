; DESCRIPTION: Creates a cyan circular shape at (235, 165) with radius 79.
; PLAN: r0=235(x), r1=165(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 165
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
