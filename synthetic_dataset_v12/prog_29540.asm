; DESCRIPTION: Places a yellow line segment connecting (184, 126) to (262, 229).
; PLAN: r0=184(x1), r1=126(y1), r2=262(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 126
LDI r2, 262
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
