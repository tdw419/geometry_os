; DESCRIPTION: Renders a green line between points (223, 36) and (241, 166).
; PLAN: r0=223(x1), r1=36(y1), r2=241(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 36
LDI r2, 241
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
