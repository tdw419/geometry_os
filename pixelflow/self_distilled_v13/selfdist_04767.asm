; DESCRIPTION: Renders a green line segment connecting (243, 32) to (5, 186).
; PLAN: r0=243(x1), r1=32(y1), r2=5(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 32
LDI r2, 5
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
