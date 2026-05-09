; DESCRIPTION: Renders a cyan line between points (375, 133) and (189, 6).
; PLAN: r0=375(x1), r1=133(y1), r2=189(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 133
LDI r2, 189
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
