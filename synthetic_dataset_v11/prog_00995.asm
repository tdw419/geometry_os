; DESCRIPTION: Renders a cyan line between points (28, 69) and (55, 183).
; PLAN: r0=28(x1), r1=69(y1), r2=55(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 69
LDI r2, 55
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
