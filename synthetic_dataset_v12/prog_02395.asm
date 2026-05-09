; DESCRIPTION: Places a green line segment connecting (141, 34) to (298, 215).
; PLAN: r0=141(x1), r1=34(y1), r2=298(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 34
LDI r2, 298
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
