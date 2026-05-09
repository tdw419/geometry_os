; DESCRIPTION: Renders a cyan line between points (162, 40) and (230, 117).
; PLAN: r0=162(x1), r1=40(y1), r2=230(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 40
LDI r2, 230
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
