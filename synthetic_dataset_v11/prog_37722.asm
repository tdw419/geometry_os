; DESCRIPTION: Draws a cyan line from (63, 91) to (150, 129).
; PLAN: r0=63(x1), r1=91(y1), r2=150(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 91
LDI r2, 150
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
