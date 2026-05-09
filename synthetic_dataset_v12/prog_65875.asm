; DESCRIPTION: Places a green line segment connecting (284, 217) to (498, 183).
; PLAN: r0=284(x1), r1=217(y1), r2=498(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 217
LDI r2, 498
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
