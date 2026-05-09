; DESCRIPTION: Draws a green line from (103, 25) to (220, 92).
; PLAN: r0=103(x1), r1=25(y1), r2=220(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 25
LDI r2, 220
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
