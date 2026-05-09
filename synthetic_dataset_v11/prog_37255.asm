; DESCRIPTION: Draws a cyan line from (128, 132) to (241, 197).
; PLAN: r0=128(x1), r1=132(y1), r2=241(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 132
LDI r2, 241
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
