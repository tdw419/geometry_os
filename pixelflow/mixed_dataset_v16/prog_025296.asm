; DESCRIPTION: Places a cyan line segment connecting (235, 18) to (86, 52).
; PLAN: r0=235(x1), r1=18(y1), r2=86(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 18
LDI r2, 86
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
