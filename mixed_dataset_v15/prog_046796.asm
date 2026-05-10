; DESCRIPTION: Draws a cyan line from (418, 245) to (426, 121).
; PLAN: r0=418(x1), r1=245(y1), r2=426(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 245
LDI r2, 426
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
