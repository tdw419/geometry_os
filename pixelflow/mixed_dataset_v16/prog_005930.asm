; DESCRIPTION: Renders a white line between points (364, 225) and (210, 236).
; PLAN: r0=364(x1), r1=225(y1), r2=210(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 225
LDI r2, 210
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
