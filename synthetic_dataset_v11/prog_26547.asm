; DESCRIPTION: Renders a cyan line between points (94, 130) and (206, 94).
; PLAN: r0=94(x1), r1=130(y1), r2=206(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 130
LDI r2, 206
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
