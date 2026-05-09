; DESCRIPTION: Draws a green line from (479, 43) to (150, 93).
; PLAN: r0=479(x1), r1=43(y1), r2=150(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 43
LDI r2, 150
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
