; DESCRIPTION: Renders a yellow line between points (25, 125) and (295, 84).
; PLAN: r0=25(x1), r1=125(y1), r2=295(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 125
LDI r2, 295
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
