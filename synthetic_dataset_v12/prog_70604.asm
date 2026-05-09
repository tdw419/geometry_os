; DESCRIPTION: Places a black line segment connecting (275, 82) to (437, 243).
; PLAN: r0=275(x1), r1=82(y1), r2=437(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 82
LDI r2, 437
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
