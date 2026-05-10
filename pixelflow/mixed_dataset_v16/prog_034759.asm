; DESCRIPTION: Places a black line segment connecting (180, 38) to (413, 236).
; PLAN: r0=180(x1), r1=38(y1), r2=413(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 38
LDI r2, 413
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
