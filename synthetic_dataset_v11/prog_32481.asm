; DESCRIPTION: Renders a cyan line between points (236, 161) and (5, 138).
; PLAN: r0=236(x1), r1=161(y1), r2=5(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 161
LDI r2, 5
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
