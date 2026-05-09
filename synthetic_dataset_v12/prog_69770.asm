; DESCRIPTION: Draws a green line from (416, 187) to (464, 198).
; PLAN: r0=416(x1), r1=187(y1), r2=464(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 187
LDI r2, 464
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
