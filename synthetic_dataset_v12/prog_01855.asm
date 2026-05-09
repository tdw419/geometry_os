; DESCRIPTION: Renders a yellow line between points (510, 249) and (445, 148).
; PLAN: r0=510(x1), r1=249(y1), r2=445(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 249
LDI r2, 445
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
