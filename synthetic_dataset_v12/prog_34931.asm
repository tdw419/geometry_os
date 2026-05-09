; DESCRIPTION: Places a cyan line segment connecting (397, 86) to (373, 44).
; PLAN: r0=397(x1), r1=86(y1), r2=373(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 86
LDI r2, 373
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
