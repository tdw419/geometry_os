; DESCRIPTION: Renders a orange line between points (431, 237) and (392, 210).
; PLAN: r0=431(x1), r1=237(y1), r2=392(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 237
LDI r2, 392
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
