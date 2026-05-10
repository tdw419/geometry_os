; DESCRIPTION: Renders a green line between points (479, 237) and (375, 229).
; PLAN: r0=479(x1), r1=237(y1), r2=375(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 237
LDI r2, 375
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
