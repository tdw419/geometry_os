; DESCRIPTION: Places a green line segment connecting (107, 54) to (298, 128).
; PLAN: r0=107(x1), r1=54(y1), r2=298(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 54
LDI r2, 298
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
