; DESCRIPTION: Renders a cyan line between points (444, 197) and (441, 101).
; PLAN: r0=444(x1), r1=197(y1), r2=441(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 197
LDI r2, 441
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
