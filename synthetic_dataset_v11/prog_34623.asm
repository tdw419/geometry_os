; DESCRIPTION: Places a black line segment connecting (146, 133) to (166, 255).
; PLAN: r0=146(x1), r1=133(y1), r2=166(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 133
LDI r2, 166
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
