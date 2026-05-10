; DESCRIPTION: Draws a cyan line from (372, 192) to (382, 115).
; PLAN: r0=372(x1), r1=192(y1), r2=382(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 192
LDI r2, 382
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
