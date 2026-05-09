; DESCRIPTION: Renders a white line between points (446, 232) and (166, 46).
; PLAN: r0=446(x1), r1=232(y1), r2=166(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 232
LDI r2, 166
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
