; DESCRIPTION: Renders a black line between points (380, 91) and (254, 242).
; PLAN: r0=380(x1), r1=91(y1), r2=254(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 91
LDI r2, 254
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
