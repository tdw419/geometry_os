; DESCRIPTION: Places a yellow line segment connecting (215, 59) to (212, 242).
; PLAN: r0=215(x1), r1=59(y1), r2=212(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 59
LDI r2, 212
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
