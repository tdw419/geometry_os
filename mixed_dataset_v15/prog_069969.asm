; DESCRIPTION: Draws a cyan line from (13, 206) to (36, 176).
; PLAN: r0=13(x1), r1=206(y1), r2=36(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 206
LDI r2, 36
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
