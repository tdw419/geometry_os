; DESCRIPTION: Renders a green line between points (97, 152) and (1, 195).
; PLAN: r0=97(x1), r1=152(y1), r2=1(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 152
LDI r2, 1
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
