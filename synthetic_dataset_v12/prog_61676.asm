; DESCRIPTION: Places a cyan line segment connecting (11, 204) to (301, 242).
; PLAN: r0=11(x1), r1=204(y1), r2=301(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 204
LDI r2, 301
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
