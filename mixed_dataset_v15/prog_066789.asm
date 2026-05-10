; DESCRIPTION: Places a black line segment connecting (434, 154) to (328, 149).
; PLAN: r0=434(x1), r1=154(y1), r2=328(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 154
LDI r2, 328
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
