; DESCRIPTION: Draws a red line from (82, 84) to (128, 197).
; PLAN: r0=82(x1), r1=84(y1), r2=128(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 84
LDI r2, 128
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
