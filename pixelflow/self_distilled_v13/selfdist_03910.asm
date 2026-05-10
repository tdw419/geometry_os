; DESCRIPTION: Renders a cyan line segment connecting (320, 49) to (264, 181).
; PLAN: r0=320(x1), r1=49(y1), r2=264(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 49
LDI r2, 264
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
