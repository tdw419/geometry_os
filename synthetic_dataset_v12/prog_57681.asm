; DESCRIPTION: Renders a green line between points (329, 149) and (469, 178).
; PLAN: r0=329(x1), r1=149(y1), r2=469(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 149
LDI r2, 469
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
