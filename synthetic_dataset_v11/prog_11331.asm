; DESCRIPTION: Renders a green line between points (243, 65) and (66, 202).
; PLAN: r0=243(x1), r1=65(y1), r2=66(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 65
LDI r2, 66
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
