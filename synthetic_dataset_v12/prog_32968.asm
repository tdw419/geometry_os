; DESCRIPTION: Places a cyan line segment connecting (313, 152) to (193, 72).
; PLAN: r0=313(x1), r1=152(y1), r2=193(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 152
LDI r2, 193
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
