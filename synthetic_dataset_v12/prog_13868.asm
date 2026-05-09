; DESCRIPTION: Draws a cyan line from (157, 103) to (10, 99).
; PLAN: r0=157(x1), r1=103(y1), r2=10(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 103
LDI r2, 10
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
