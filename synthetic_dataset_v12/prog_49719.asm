; DESCRIPTION: Renders a white line between points (211, 99) and (199, 128).
; PLAN: r0=211(x1), r1=99(y1), r2=199(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 99
LDI r2, 199
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
