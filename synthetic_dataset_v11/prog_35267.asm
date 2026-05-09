; DESCRIPTION: Draws a yellow line from (60, 56) to (98, 173).
; PLAN: r0=60(x1), r1=56(y1), r2=98(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 56
LDI r2, 98
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
