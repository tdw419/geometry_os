; DESCRIPTION: Renders a cyan line between points (207, 183) and (373, 124).
; PLAN: r0=207(x1), r1=183(y1), r2=373(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 183
LDI r2, 373
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
