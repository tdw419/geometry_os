; DESCRIPTION: Renders a magenta line between points (479, 10) and (479, 216).
; PLAN: r0=479(x1), r1=10(y1), r2=479(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 10
LDI r2, 479
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
