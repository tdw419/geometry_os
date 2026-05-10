; DESCRIPTION: Draws a cyan line from (249, 128) to (383, 183).
; PLAN: r0=249(x1), r1=128(y1), r2=383(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 128
LDI r2, 383
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
