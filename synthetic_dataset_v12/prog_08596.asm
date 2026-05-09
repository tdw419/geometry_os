; DESCRIPTION: Places a white line segment connecting (80, 125) to (479, 93).
; PLAN: r0=80(x1), r1=125(y1), r2=479(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 125
LDI r2, 479
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
