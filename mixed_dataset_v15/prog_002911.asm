; DESCRIPTION: Places a black line segment connecting (380, 46) to (361, 52).
; PLAN: r0=380(x1), r1=46(y1), r2=361(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 46
LDI r2, 361
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
