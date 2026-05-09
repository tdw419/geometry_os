; DESCRIPTION: Places a red line segment connecting (173, 134) to (235, 28).
; PLAN: r0=173(x1), r1=134(y1), r2=235(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 134
LDI r2, 235
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
