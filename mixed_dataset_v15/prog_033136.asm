; DESCRIPTION: Draws a black line from (152, 65) to (483, 242).
; PLAN: r0=152(x1), r1=65(y1), r2=483(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 65
LDI r2, 483
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
