; DESCRIPTION: Renders a yellow line between points (87, 75) and (502, 209).
; PLAN: r0=87(x1), r1=75(y1), r2=502(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 75
LDI r2, 502
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
