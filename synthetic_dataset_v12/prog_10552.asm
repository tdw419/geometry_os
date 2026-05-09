; DESCRIPTION: Renders a yellow line between points (410, 209) and (329, 227).
; PLAN: r0=410(x1), r1=209(y1), r2=329(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 209
LDI r2, 329
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
