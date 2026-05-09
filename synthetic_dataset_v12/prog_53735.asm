; DESCRIPTION: Places a cyan line segment connecting (236, 245) to (208, 191).
; PLAN: r0=236(x1), r1=245(y1), r2=208(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 245
LDI r2, 208
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
