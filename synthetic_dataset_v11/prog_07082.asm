; DESCRIPTION: Places a red line segment connecting (235, 240) to (146, 38).
; PLAN: r0=235(x1), r1=240(y1), r2=146(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 240
LDI r2, 146
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
