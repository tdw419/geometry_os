; DESCRIPTION: Places a green line segment connecting (202, 255) to (301, 32).
; PLAN: r0=202(x1), r1=255(y1), r2=301(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 255
LDI r2, 301
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
