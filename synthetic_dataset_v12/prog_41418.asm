; DESCRIPTION: Places a blue line segment connecting (242, 197) to (406, 192).
; PLAN: r0=242(x1), r1=197(y1), r2=406(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 197
LDI r2, 406
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
