; DESCRIPTION: Renders a white line between points (280, 142) and (319, 236).
; PLAN: r0=280(x1), r1=142(y1), r2=319(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 142
LDI r2, 319
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
