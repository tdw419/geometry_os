; DESCRIPTION: Places a green line segment connecting (181, 154) to (54, 235).
; PLAN: r0=181(x1), r1=154(y1), r2=54(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 154
LDI r2, 54
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
