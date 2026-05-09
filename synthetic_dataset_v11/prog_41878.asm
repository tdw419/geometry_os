; DESCRIPTION: Places a cyan line segment connecting (239, 64) to (183, 106).
; PLAN: r0=239(x1), r1=64(y1), r2=183(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 64
LDI r2, 183
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
