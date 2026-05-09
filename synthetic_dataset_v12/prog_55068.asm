; DESCRIPTION: Places a yellow line segment connecting (333, 107) to (215, 234).
; PLAN: r0=333(x1), r1=107(y1), r2=215(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 107
LDI r2, 215
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
