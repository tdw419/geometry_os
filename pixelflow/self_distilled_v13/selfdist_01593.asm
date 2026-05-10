; DESCRIPTION: Renders a white line segment connecting (8, 74) to (243, 28).
; PLAN: r0=8(x1), r1=74(y1), r2=243(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 74
LDI r2, 243
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
