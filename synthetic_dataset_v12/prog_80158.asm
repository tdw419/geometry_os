; DESCRIPTION: Renders a cyan line between points (489, 7) and (362, 49).
; PLAN: r0=489(x1), r1=7(y1), r2=362(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 7
LDI r2, 362
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
