; DESCRIPTION: Renders a white line between points (97, 78) and (404, 166).
; PLAN: r0=97(x1), r1=78(y1), r2=404(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 78
LDI r2, 404
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
