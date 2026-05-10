; DESCRIPTION: Renders a cyan line segment connecting (117, 190) to (70, 159).
; PLAN: r0=117(x1), r1=190(y1), r2=70(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 190
LDI r2, 70
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
