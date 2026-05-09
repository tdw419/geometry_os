; DESCRIPTION: Draws a yellow line from (21, 70) to (197, 154).
; PLAN: r0=21(x1), r1=70(y1), r2=197(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 70
LDI r2, 197
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
