; DESCRIPTION: Renders a green line between points (113, 1) and (202, 194).
; PLAN: r0=113(x1), r1=1(y1), r2=202(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 1
LDI r2, 202
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
