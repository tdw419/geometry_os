; DESCRIPTION: Places a cyan line segment connecting (196, 196) to (104, 169).
; PLAN: r0=196(x1), r1=196(y1), r2=104(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 196
LDI r2, 104
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
