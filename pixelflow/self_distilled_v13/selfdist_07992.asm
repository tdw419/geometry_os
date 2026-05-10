; DESCRIPTION: Renders a green line segment connecting (361, 111) to (39, 180).
; PLAN: r0=361(x1), r1=111(y1), r2=39(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 111
LDI r2, 39
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
