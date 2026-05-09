; DESCRIPTION: Renders a yellow line between points (70, 125) and (117, 231).
; PLAN: r0=70(x1), r1=125(y1), r2=117(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 125
LDI r2, 117
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
