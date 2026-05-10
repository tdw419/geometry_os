; DESCRIPTION: Renders a cyan line between points (446, 184) and (226, 179).
; PLAN: r0=446(x1), r1=184(y1), r2=226(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 184
LDI r2, 226
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
