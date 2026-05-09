; DESCRIPTION: Renders a green line between points (87, 19) and (43, 174).
; PLAN: r0=87(x1), r1=19(y1), r2=43(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 19
LDI r2, 43
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
