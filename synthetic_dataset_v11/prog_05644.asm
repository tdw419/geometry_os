; DESCRIPTION: Places a black line segment connecting (32, 64) to (174, 59).
; PLAN: r0=32(x1), r1=64(y1), r2=174(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 64
LDI r2, 174
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
