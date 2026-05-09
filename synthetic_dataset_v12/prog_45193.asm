; DESCRIPTION: Places a cyan line segment connecting (358, 163) to (499, 254).
; PLAN: r0=358(x1), r1=163(y1), r2=499(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 163
LDI r2, 499
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
