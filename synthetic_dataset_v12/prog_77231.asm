; DESCRIPTION: Renders a green line between points (428, 27) and (319, 72).
; PLAN: r0=428(x1), r1=27(y1), r2=319(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 27
LDI r2, 319
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
