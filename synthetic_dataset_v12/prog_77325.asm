; DESCRIPTION: Renders a black line between points (301, 214) and (241, 242).
; PLAN: r0=301(x1), r1=214(y1), r2=241(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 214
LDI r2, 241
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
