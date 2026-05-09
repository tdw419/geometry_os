; DESCRIPTION: Draws a cyan line from (195, 243) to (430, 62).
; PLAN: r0=195(x1), r1=243(y1), r2=430(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 243
LDI r2, 430
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
