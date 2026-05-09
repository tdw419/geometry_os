; DESCRIPTION: Draws a green line from (330, 240) to (17, 95).
; PLAN: r0=330(x1), r1=240(y1), r2=17(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 240
LDI r2, 17
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
