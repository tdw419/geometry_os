; DESCRIPTION: Draws a magenta line from (153, 165) to (479, 180).
; PLAN: r0=153(x1), r1=165(y1), r2=479(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 165
LDI r2, 479
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
