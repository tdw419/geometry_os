; DESCRIPTION: Places a cyan line segment connecting (235, 159) to (271, 32).
; PLAN: r0=235(x1), r1=159(y1), r2=271(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 159
LDI r2, 271
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
