; DESCRIPTION: Places a cyan line segment connecting (305, 152) to (94, 102).
; PLAN: r0=305(x1), r1=152(y1), r2=94(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 152
LDI r2, 94
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
