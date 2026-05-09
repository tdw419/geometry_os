; DESCRIPTION: Renders a cyan line between points (185, 141) and (168, 184).
; PLAN: r0=185(x1), r1=141(y1), r2=168(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 141
LDI r2, 168
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
