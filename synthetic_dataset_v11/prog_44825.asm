; DESCRIPTION: Draws a green line from (6, 239) to (98, 78).
; PLAN: r0=6(x1), r1=239(y1), r2=98(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 239
LDI r2, 98
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
