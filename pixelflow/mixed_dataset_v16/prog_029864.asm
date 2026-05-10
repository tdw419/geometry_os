; DESCRIPTION: Places a green line segment connecting (446, 23) to (56, 235).
; PLAN: r0=446(x1), r1=23(y1), r2=56(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 23
LDI r2, 56
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
