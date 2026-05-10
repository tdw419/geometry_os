; DESCRIPTION: Renders a cyan line segment connecting (25, 59) to (8, 142).
; PLAN: r0=25(x1), r1=59(y1), r2=8(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 59
LDI r2, 8
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
