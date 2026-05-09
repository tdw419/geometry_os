; DESCRIPTION: Places a white line segment connecting (328, 129) to (326, 215).
; PLAN: r0=328(x1), r1=129(y1), r2=326(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 129
LDI r2, 326
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
