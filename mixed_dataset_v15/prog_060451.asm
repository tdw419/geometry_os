; DESCRIPTION: Renders a yellow line segment connecting (320, 50) to (235, 47).
; PLAN: r0=320(x1), r1=50(y1), r2=235(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 50
LDI r2, 235
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
