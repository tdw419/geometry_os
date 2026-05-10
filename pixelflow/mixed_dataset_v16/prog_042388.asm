; DESCRIPTION: Places a green line segment connecting (295, 28) to (281, 89).
; PLAN: r0=295(x1), r1=28(y1), r2=281(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 28
LDI r2, 281
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
