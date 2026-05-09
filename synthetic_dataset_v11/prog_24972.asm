; DESCRIPTION: Places a cyan line segment connecting (238, 32) to (183, 222).
; PLAN: r0=238(x1), r1=32(y1), r2=183(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 32
LDI r2, 183
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
