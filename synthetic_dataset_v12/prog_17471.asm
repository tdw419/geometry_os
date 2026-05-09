; DESCRIPTION: Draws a cyan line from (390, 128) to (114, 224).
; PLAN: r0=390(x1), r1=128(y1), r2=114(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 128
LDI r2, 114
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
