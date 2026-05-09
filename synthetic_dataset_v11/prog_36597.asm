; DESCRIPTION: Renders a white line between points (197, 132) and (127, 123).
; PLAN: r0=197(x1), r1=132(y1), r2=127(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 132
LDI r2, 127
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
