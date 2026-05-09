; DESCRIPTION: Draws a cyan line from (97, 245) to (142, 234).
; PLAN: r0=97(x1), r1=245(y1), r2=142(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 245
LDI r2, 142
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
