; DESCRIPTION: Draws a green line from (135, 70) to (165, 60).
; PLAN: r0=135(x1), r1=70(y1), r2=165(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 70
LDI r2, 165
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
