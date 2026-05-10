; DESCRIPTION: Places a red 24x104 box at position (235, 137).
; PLAN: r0=235(x), r1=137(y), r2=24(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 137
LDI r2, 24
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
