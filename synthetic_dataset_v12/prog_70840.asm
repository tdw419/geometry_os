; DESCRIPTION: Renders a cyan line between points (336, 154) and (407, 243).
; PLAN: r0=336(x1), r1=154(y1), r2=407(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 154
LDI r2, 407
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
