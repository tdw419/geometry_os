; DESCRIPTION: Renders a cyan line between points (204, 156) and (295, 14).
; PLAN: r0=204(x1), r1=156(y1), r2=295(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 156
LDI r2, 295
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
