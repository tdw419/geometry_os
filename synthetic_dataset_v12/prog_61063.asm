; DESCRIPTION: Renders a yellow line between points (183, 193) and (313, 166).
; PLAN: r0=183(x1), r1=193(y1), r2=313(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 193
LDI r2, 313
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
