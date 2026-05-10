; DESCRIPTION: Renders a cyan line segment connecting (182, 189) to (65, 135).
; PLAN: r0=182(x1), r1=189(y1), r2=65(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 189
LDI r2, 65
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
