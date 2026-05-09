; DESCRIPTION: Renders a cyan line between points (207, 128) and (44, 97).
; PLAN: r0=207(x1), r1=128(y1), r2=44(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 128
LDI r2, 44
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
