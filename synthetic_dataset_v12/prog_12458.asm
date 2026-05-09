; DESCRIPTION: Draws a red line from (443, 80) to (479, 136).
; PLAN: r0=443(x1), r1=80(y1), r2=479(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 80
LDI r2, 479
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
