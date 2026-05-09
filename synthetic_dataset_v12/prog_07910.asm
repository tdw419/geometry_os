; DESCRIPTION: Renders a green line between points (105, 37) and (329, 83).
; PLAN: r0=105(x1), r1=37(y1), r2=329(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 37
LDI r2, 329
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
