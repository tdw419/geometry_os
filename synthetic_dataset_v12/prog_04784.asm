; DESCRIPTION: Places a black line segment connecting (87, 180) to (328, 207).
; PLAN: r0=87(x1), r1=180(y1), r2=328(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 180
LDI r2, 328
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
