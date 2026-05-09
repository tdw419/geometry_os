; DESCRIPTION: Places a black line segment connecting (308, 231) to (209, 166).
; PLAN: r0=308(x1), r1=231(y1), r2=209(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 231
LDI r2, 209
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
