; DESCRIPTION: Renders a cyan line between points (166, 100) and (151, 254).
; PLAN: r0=166(x1), r1=100(y1), r2=151(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 100
LDI r2, 151
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
