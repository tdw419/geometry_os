; DESCRIPTION: Places a black line segment connecting (392, 86) to (113, 10).
; PLAN: r0=392(x1), r1=86(y1), r2=113(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 86
LDI r2, 113
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
