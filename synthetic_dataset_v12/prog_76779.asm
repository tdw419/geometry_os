; DESCRIPTION: Renders a white line between points (320, 106) and (479, 99).
; PLAN: r0=320(x1), r1=106(y1), r2=479(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 106
LDI r2, 479
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
