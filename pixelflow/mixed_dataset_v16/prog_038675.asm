; DESCRIPTION: Places a cyan line segment connecting (479, 125) to (56, 148).
; PLAN: r0=479(x1), r1=125(y1), r2=56(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 125
LDI r2, 56
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
