; DESCRIPTION: Draws a yellow line from (398, 91) to (421, 82).
; PLAN: r0=398(x1), r1=91(y1), r2=421(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 91
LDI r2, 421
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
