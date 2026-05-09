; DESCRIPTION: Renders a green line between points (178, 252) and (164, 27).
; PLAN: r0=178(x1), r1=252(y1), r2=164(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 252
LDI r2, 164
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
