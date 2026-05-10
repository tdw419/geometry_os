; DESCRIPTION: Places a black line segment connecting (394, 59) to (356, 32).
; PLAN: r0=394(x1), r1=59(y1), r2=356(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 59
LDI r2, 356
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
