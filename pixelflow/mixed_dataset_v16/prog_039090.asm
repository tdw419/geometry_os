; DESCRIPTION: Renders a black line between points (152, 137) and (82, 32).
; PLAN: r0=152(x1), r1=137(y1), r2=82(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 137
LDI r2, 82
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
