; DESCRIPTION: Places a cyan line segment connecting (29, 128) to (279, 44).
; PLAN: r0=29(x1), r1=128(y1), r2=279(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 128
LDI r2, 279
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
