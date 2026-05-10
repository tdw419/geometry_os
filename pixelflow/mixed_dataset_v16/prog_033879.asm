; DESCRIPTION: Renders a green line between points (319, 245) and (279, 241).
; PLAN: r0=319(x1), r1=245(y1), r2=279(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 245
LDI r2, 279
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
