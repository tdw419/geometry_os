; DESCRIPTION: Places a cyan line segment connecting (136, 79) to (63, 202).
; PLAN: r0=136(x1), r1=79(y1), r2=63(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 79
LDI r2, 63
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
