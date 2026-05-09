; DESCRIPTION: Places a cyan line segment connecting (272, 96) to (321, 148).
; PLAN: r0=272(x1), r1=96(y1), r2=321(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 96
LDI r2, 321
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
