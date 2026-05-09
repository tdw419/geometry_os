; DESCRIPTION: Draws a cyan line from (157, 119) to (128, 196).
; PLAN: r0=157(x1), r1=119(y1), r2=128(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 119
LDI r2, 128
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
