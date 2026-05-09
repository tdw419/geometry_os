; DESCRIPTION: Places a black line segment connecting (406, 237) to (193, 143).
; PLAN: r0=406(x1), r1=237(y1), r2=193(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 237
LDI r2, 193
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
