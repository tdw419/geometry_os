; DESCRIPTION: Places a cyan line segment connecting (168, 161) to (336, 93).
; PLAN: r0=168(x1), r1=161(y1), r2=336(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 161
LDI r2, 336
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
