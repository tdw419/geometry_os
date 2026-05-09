; DESCRIPTION: Renders a cyan line between points (127, 69) and (100, 144).
; PLAN: r0=127(x1), r1=69(y1), r2=100(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 69
LDI r2, 100
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
