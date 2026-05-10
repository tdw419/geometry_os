; DESCRIPTION: Draws a cyan line from (38, 15) to (156, 21).
; PLAN: r0=38(x1), r1=15(y1), r2=156(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 15
LDI r2, 156
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
