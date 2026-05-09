; DESCRIPTION: Renders a cyan line between points (228, 178) and (89, 136).
; PLAN: r0=228(x1), r1=178(y1), r2=89(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 178
LDI r2, 89
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
