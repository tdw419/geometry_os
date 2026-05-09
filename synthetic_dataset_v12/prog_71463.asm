; DESCRIPTION: Places a white line segment connecting (415, 159) to (151, 235).
; PLAN: r0=415(x1), r1=159(y1), r2=151(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 159
LDI r2, 151
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
