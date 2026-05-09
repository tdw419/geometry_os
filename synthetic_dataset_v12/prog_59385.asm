; DESCRIPTION: Renders a red line between points (479, 184) and (203, 37).
; PLAN: r0=479(x1), r1=184(y1), r2=203(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 184
LDI r2, 203
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
