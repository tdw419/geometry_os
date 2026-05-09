; DESCRIPTION: Places a black line segment connecting (286, 82) to (398, 60).
; PLAN: r0=286(x1), r1=82(y1), r2=398(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 82
LDI r2, 398
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
