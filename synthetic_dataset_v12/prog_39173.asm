; DESCRIPTION: Renders a magenta line between points (221, 104) and (239, 205).
; PLAN: r0=221(x1), r1=104(y1), r2=239(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 104
LDI r2, 239
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
