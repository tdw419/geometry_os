; DESCRIPTION: Renders a cyan line between points (158, 216) and (131, 125).
; PLAN: r0=158(x1), r1=216(y1), r2=131(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 216
LDI r2, 131
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
