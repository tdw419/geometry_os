; DESCRIPTION: Draws a orange line from (199, 244) to (113, 235).
; PLAN: r0=199(x1), r1=244(y1), r2=113(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 244
LDI r2, 113
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
