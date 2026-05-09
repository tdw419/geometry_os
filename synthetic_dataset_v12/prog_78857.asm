; DESCRIPTION: Draws a green line from (434, 138) to (44, 115).
; PLAN: r0=434(x1), r1=138(y1), r2=44(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 138
LDI r2, 44
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
