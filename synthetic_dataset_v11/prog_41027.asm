; DESCRIPTION: Places a green line segment connecting (235, 205) to (17, 195).
; PLAN: r0=235(x1), r1=205(y1), r2=17(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 205
LDI r2, 17
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
