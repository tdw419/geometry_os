; DESCRIPTION: Renders a white line between points (378, 2) and (284, 234).
; PLAN: r0=378(x1), r1=2(y1), r2=284(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 2
LDI r2, 284
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
