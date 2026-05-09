; DESCRIPTION: Places a cyan line segment connecting (184, 235) to (86, 168).
; PLAN: r0=184(x1), r1=235(y1), r2=86(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 235
LDI r2, 86
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
