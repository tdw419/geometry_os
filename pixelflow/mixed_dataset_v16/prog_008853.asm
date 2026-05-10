; DESCRIPTION: Places a green line segment connecting (327, 129) to (295, 80).
; PLAN: r0=327(x1), r1=129(y1), r2=295(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 129
LDI r2, 295
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
