; DESCRIPTION: Draws a green line from (464, 5) to (470, 84).
; PLAN: r0=464(x1), r1=5(y1), r2=470(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 5
LDI r2, 470
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
