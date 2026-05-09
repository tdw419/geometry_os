; DESCRIPTION: Places a cyan line segment connecting (160, 145) to (152, 57).
; PLAN: r0=160(x1), r1=145(y1), r2=152(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 145
LDI r2, 152
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
