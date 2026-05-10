; DESCRIPTION: Renders a cyan line segment connecting (117, 139) to (184, 132).
; PLAN: r0=117(x1), r1=139(y1), r2=184(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 139
LDI r2, 184
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
