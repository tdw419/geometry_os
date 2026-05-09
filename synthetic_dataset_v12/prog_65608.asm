; DESCRIPTION: Places a green line segment connecting (242, 187) to (284, 53).
; PLAN: r0=242(x1), r1=187(y1), r2=284(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 187
LDI r2, 284
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
