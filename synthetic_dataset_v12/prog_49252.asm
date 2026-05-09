; DESCRIPTION: Renders a green line between points (289, 206) and (364, 38).
; PLAN: r0=289(x1), r1=206(y1), r2=364(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 206
LDI r2, 364
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
