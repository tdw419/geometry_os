; DESCRIPTION: Renders a cyan line between points (420, 183) and (351, 221).
; PLAN: r0=420(x1), r1=183(y1), r2=351(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 183
LDI r2, 351
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
