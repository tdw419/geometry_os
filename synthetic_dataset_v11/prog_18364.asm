; DESCRIPTION: Renders a cyan line between points (182, 123) and (25, 236).
; PLAN: r0=182(x1), r1=123(y1), r2=25(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 123
LDI r2, 25
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
