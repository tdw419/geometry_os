; DESCRIPTION: Renders a cyan line segment connecting (113, 94) to (90, 109).
; PLAN: r0=113(x1), r1=94(y1), r2=90(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 94
LDI r2, 90
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
