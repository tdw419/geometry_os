; DESCRIPTION: Renders a yellow line between points (46, 246) and (290, 215).
; PLAN: r0=46(x1), r1=246(y1), r2=290(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 246
LDI r2, 290
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
