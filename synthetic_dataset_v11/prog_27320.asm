; DESCRIPTION: Places a cyan line segment connecting (143, 152) to (205, 98).
; PLAN: r0=143(x1), r1=152(y1), r2=205(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 152
LDI r2, 205
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
