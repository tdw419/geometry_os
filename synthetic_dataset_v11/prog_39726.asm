; DESCRIPTION: Draws a cyan line from (44, 144) to (140, 87).
; PLAN: r0=44(x1), r1=144(y1), r2=140(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 144
LDI r2, 140
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
