; DESCRIPTION: Draws a yellow line from (154, 250) to (445, 20).
; PLAN: r0=154(x1), r1=250(y1), r2=445(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 250
LDI r2, 445
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
