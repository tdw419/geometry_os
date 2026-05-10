; DESCRIPTION: Renders a cyan line segment connecting (362, 65) to (261, 3).
; PLAN: r0=362(x1), r1=65(y1), r2=261(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 65
LDI r2, 261
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
