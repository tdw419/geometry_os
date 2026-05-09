; DESCRIPTION: Draws a green line from (216, 15) to (255, 60).
; PLAN: r0=216(x1), r1=15(y1), r2=255(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 15
LDI r2, 255
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
