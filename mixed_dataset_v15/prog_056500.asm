; DESCRIPTION: Places a cyan line segment connecting (459, 4) to (265, 204).
; PLAN: r0=459(x1), r1=4(y1), r2=265(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 4
LDI r2, 265
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
