; DESCRIPTION: Renders a cyan line between points (220, 166) and (26, 131).
; PLAN: r0=220(x1), r1=166(y1), r2=26(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 166
LDI r2, 26
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
