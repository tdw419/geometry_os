; DESCRIPTION: Renders a green line between points (91, 210) and (173, 176).
; PLAN: r0=91(x1), r1=210(y1), r2=173(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 210
LDI r2, 173
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
