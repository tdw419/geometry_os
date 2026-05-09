; DESCRIPTION: Renders a black line between points (70, 177) and (46, 239).
; PLAN: r0=70(x1), r1=177(y1), r2=46(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 177
LDI r2, 46
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
