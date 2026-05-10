; DESCRIPTION: Places a cyan line segment connecting (152, 134) to (133, 134).
; PLAN: r0=152(x1), r1=134(y1), r2=133(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 134
LDI r2, 133
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
