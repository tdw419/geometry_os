; DESCRIPTION: Renders a white line segment connecting (39, 25) to (215, 40).
; PLAN: r0=39(x1), r1=25(y1), r2=215(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 25
LDI r2, 215
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
