; DESCRIPTION: Renders a green line between points (11, 143) and (187, 159).
; PLAN: r0=11(x1), r1=143(y1), r2=187(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 143
LDI r2, 187
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
