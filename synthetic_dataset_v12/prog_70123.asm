; DESCRIPTION: Draws a white line from (322, 130) to (107, 0).
; PLAN: r0=322(x1), r1=130(y1), r2=107(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 130
LDI r2, 107
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
