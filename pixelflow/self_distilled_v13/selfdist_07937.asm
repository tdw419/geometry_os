; DESCRIPTION: Renders a cyan line segment connecting (273, 90) to (50, 167).
; PLAN: r0=273(x1), r1=90(y1), r2=50(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 90
LDI r2, 50
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
