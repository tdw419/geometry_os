; DESCRIPTION: Places a green line segment connecting (456, 32) to (361, 113).
; PLAN: r0=456(x1), r1=32(y1), r2=361(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 32
LDI r2, 361
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
