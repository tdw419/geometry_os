; DESCRIPTION: Draws a green line from (23, 192) to (208, 215).
; PLAN: r0=23(x1), r1=192(y1), r2=208(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 192
LDI r2, 208
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
