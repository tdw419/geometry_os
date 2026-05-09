; DESCRIPTION: Places a green line segment connecting (176, 131) to (242, 210).
; PLAN: r0=176(x1), r1=131(y1), r2=242(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 131
LDI r2, 242
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
