; DESCRIPTION: Places a red circle of radius 30 at center (235, 186).
; PLAN: r0=235(x), r1=186(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 186
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
