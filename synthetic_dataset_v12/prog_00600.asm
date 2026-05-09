; DESCRIPTION: Places a cyan line segment connecting (45, 172) to (492, 48).
; PLAN: r0=45(x1), r1=172(y1), r2=492(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 172
LDI r2, 492
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
