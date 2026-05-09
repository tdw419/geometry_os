; DESCRIPTION: Places a cyan line segment connecting (229, 48) to (12, 16).
; PLAN: r0=229(x1), r1=48(y1), r2=12(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 48
LDI r2, 12
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
