; DESCRIPTION: Draws a blue line from (208, 182) to (239, 150).
; PLAN: r0=208(x1), r1=182(y1), r2=239(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 182
LDI r2, 239
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
