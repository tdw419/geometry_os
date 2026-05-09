; DESCRIPTION: Renders a white line between points (111, 236) and (455, 207).
; PLAN: r0=111(x1), r1=236(y1), r2=455(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 236
LDI r2, 455
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
