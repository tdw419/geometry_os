; DESCRIPTION: Draws a yellow line from (200, 126) to (479, 85).
; PLAN: r0=200(x1), r1=126(y1), r2=479(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 126
LDI r2, 479
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
