; DESCRIPTION: Places a cyan line segment connecting (181, 12) to (235, 8).
; PLAN: r0=181(x1), r1=12(y1), r2=235(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 12
LDI r2, 235
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
