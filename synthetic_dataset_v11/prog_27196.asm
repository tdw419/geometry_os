; DESCRIPTION: Places a cyan line segment connecting (7, 128) to (217, 247).
; PLAN: r0=7(x1), r1=128(y1), r2=217(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 128
LDI r2, 217
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
