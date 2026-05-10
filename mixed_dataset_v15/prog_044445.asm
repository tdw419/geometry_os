; DESCRIPTION: Renders a cyan line between points (461, 38) and (406, 206).
; PLAN: r0=461(x1), r1=38(y1), r2=406(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 38
LDI r2, 406
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
