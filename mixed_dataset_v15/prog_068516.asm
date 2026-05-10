; DESCRIPTION: Renders a red line segment connecting (217, 164) to (354, 192).
; PLAN: r0=217(x1), r1=164(y1), r2=354(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 164
LDI r2, 354
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
