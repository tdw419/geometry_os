; DESCRIPTION: Places a cyan line segment connecting (176, 197) to (1, 101).
; PLAN: r0=176(x1), r1=197(y1), r2=1(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 197
LDI r2, 1
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
