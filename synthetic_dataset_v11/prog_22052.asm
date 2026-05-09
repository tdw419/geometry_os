; DESCRIPTION: Draws a yellow line from (16, 129) to (117, 54).
; PLAN: r0=16(x1), r1=129(y1), r2=117(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 129
LDI r2, 117
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
