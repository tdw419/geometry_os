; DESCRIPTION: Renders a green line between points (213, 194) and (33, 194).
; PLAN: r0=213(x1), r1=194(y1), r2=33(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 194
LDI r2, 33
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
