; DESCRIPTION: Places a white line segment connecting (157, 209) to (144, 235).
; PLAN: r0=157(x1), r1=209(y1), r2=144(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 209
LDI r2, 144
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
