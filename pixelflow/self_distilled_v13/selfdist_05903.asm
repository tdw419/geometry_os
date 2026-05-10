; DESCRIPTION: Places a red disk with center (231, 4) and radius 68.
; PLAN: r0=231(x), r1=4(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 4
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
