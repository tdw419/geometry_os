; DESCRIPTION: Places a green line segment connecting (184, 211) to (180, 215).
; PLAN: r0=184(x1), r1=211(y1), r2=180(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 211
LDI r2, 180
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
