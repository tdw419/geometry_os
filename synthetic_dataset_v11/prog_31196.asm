; DESCRIPTION: Places a cyan line segment connecting (35, 144) to (202, 152).
; PLAN: r0=35(x1), r1=144(y1), r2=202(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 144
LDI r2, 202
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
