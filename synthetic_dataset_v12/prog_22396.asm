; DESCRIPTION: Renders a white line between points (283, 138) and (479, 203).
; PLAN: r0=283(x1), r1=138(y1), r2=479(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 138
LDI r2, 479
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
