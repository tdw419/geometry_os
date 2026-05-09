; DESCRIPTION: Renders a green line between points (151, 127) and (165, 38).
; PLAN: r0=151(x1), r1=127(y1), r2=165(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 127
LDI r2, 165
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
