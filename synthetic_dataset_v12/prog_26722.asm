; DESCRIPTION: Renders a green line between points (199, 202) and (444, 173).
; PLAN: r0=199(x1), r1=202(y1), r2=444(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 202
LDI r2, 444
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
