; DESCRIPTION: Places a cyan line segment connecting (222, 87) to (460, 128).
; PLAN: r0=222(x1), r1=87(y1), r2=460(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 87
LDI r2, 460
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
