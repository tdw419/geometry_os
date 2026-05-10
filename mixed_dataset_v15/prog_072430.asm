; DESCRIPTION: Draws a green line from (50, 50) to (86, 127).
; PLAN: r0=50(x1), r1=50(y1), r2=86(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 86
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
