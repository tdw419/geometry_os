; DESCRIPTION: Draws a cyan line from (57, 31) to (236, 44).
; PLAN: r0=57(x1), r1=31(y1), r2=236(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 236
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
