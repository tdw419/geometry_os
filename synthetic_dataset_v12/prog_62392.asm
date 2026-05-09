; DESCRIPTION: Renders a cyan line between points (171, 62) and (406, 230).
; PLAN: r0=171(x1), r1=62(y1), r2=406(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 62
LDI r2, 406
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
