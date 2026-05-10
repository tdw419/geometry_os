; DESCRIPTION: Renders a cyan line segment connecting (190, 168) to (62, 117).
; PLAN: r0=190(x1), r1=168(y1), r2=62(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 168
LDI r2, 62
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
