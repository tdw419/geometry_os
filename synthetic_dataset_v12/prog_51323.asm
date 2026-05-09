; DESCRIPTION: Draws a green line from (328, 5) to (374, 40).
; PLAN: r0=328(x1), r1=5(y1), r2=374(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 5
LDI r2, 374
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
