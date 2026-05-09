; DESCRIPTION: Places a black line segment connecting (434, 10) to (46, 193).
; PLAN: r0=434(x1), r1=10(y1), r2=46(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 10
LDI r2, 46
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
