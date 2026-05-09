; DESCRIPTION: Draws a cyan line from (155, 213) to (231, 86).
; PLAN: r0=155(x1), r1=213(y1), r2=231(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 213
LDI r2, 231
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
