; DESCRIPTION: Places a cyan line segment connecting (14, 141) to (27, 184).
; PLAN: r0=14(x1), r1=141(y1), r2=27(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 141
LDI r2, 27
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
