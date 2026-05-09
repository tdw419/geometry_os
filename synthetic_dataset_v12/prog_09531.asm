; DESCRIPTION: Draws a magenta line from (298, 174) to (438, 224).
; PLAN: r0=298(x1), r1=174(y1), r2=438(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 174
LDI r2, 438
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
