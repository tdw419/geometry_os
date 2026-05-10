; DESCRIPTION: Draws a green line from (65, 20) to (450, 86).
; PLAN: r0=65(x1), r1=20(y1), r2=450(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 20
LDI r2, 450
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
