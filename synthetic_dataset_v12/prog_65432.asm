; DESCRIPTION: Places a magenta line segment connecting (479, 34) to (128, 242).
; PLAN: r0=479(x1), r1=34(y1), r2=128(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 34
LDI r2, 128
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
