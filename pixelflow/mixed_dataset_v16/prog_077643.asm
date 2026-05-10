; DESCRIPTION: Renders a white line between points (494, 114) and (504, 221).
; PLAN: r0=494(x1), r1=114(y1), r2=504(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 114
LDI r2, 504
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
