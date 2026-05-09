; DESCRIPTION: Places a cyan line segment connecting (144, 235) to (223, 230).
; PLAN: r0=144(x1), r1=235(y1), r2=223(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 235
LDI r2, 223
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
