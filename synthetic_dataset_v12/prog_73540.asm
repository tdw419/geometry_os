; DESCRIPTION: Places a green line segment connecting (284, 128) to (116, 0).
; PLAN: r0=284(x1), r1=128(y1), r2=116(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 128
LDI r2, 116
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
