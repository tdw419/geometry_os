; DESCRIPTION: Renders a white line between points (164, 204) and (294, 211).
; PLAN: r0=164(x1), r1=204(y1), r2=294(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 204
LDI r2, 294
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
