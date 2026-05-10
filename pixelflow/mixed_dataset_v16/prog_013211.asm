; DESCRIPTION: Draws a yellow line from (220, 13) to (42, 129).
; PLAN: r0=220(x1), r1=13(y1), r2=42(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 13
LDI r2, 42
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
