; DESCRIPTION: Draws a magenta line from (184, 91) to (66, 166).
; PLAN: r0=184(x1), r1=91(y1), r2=66(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 91
LDI r2, 66
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
