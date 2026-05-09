; DESCRIPTION: Places a cyan line segment connecting (98, 113) to (325, 95).
; PLAN: r0=98(x1), r1=113(y1), r2=325(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 113
LDI r2, 325
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
