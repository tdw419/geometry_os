; DESCRIPTION: Renders a green line between points (127, 177) and (25, 193).
; PLAN: r0=127(x1), r1=177(y1), r2=25(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 177
LDI r2, 25
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
