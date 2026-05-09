; DESCRIPTION: Places a green line segment connecting (298, 167) to (290, 38).
; PLAN: r0=298(x1), r1=167(y1), r2=290(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 167
LDI r2, 290
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
