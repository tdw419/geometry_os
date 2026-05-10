; DESCRIPTION: Renders a green line segment connecting (143, 168) to (292, 182).
; PLAN: r0=143(x1), r1=168(y1), r2=292(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 168
LDI r2, 292
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
