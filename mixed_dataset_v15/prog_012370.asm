; DESCRIPTION: Places a black line segment connecting (480, 120) to (91, 27).
; PLAN: r0=480(x1), r1=120(y1), r2=91(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 120
LDI r2, 91
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
