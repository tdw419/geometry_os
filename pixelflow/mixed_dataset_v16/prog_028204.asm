; DESCRIPTION: Renders a yellow line segment connecting (320, 126) to (90, 21).
; PLAN: r0=320(x1), r1=126(y1), r2=90(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 126
LDI r2, 90
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
