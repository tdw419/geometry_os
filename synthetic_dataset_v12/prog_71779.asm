; DESCRIPTION: Renders a green line between points (510, 16) and (329, 138).
; PLAN: r0=510(x1), r1=16(y1), r2=329(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 16
LDI r2, 329
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
