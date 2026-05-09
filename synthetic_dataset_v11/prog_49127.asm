; DESCRIPTION: Places a cyan line segment connecting (184, 186) to (77, 152).
; PLAN: r0=184(x1), r1=186(y1), r2=77(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 186
LDI r2, 77
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
