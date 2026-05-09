; DESCRIPTION: Renders a green line between points (221, 13) and (4, 166).
; PLAN: r0=221(x1), r1=13(y1), r2=4(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 13
LDI r2, 4
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
