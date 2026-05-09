; DESCRIPTION: Renders a green line between points (202, 200) and (247, 172).
; PLAN: r0=202(x1), r1=200(y1), r2=247(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 200
LDI r2, 247
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
