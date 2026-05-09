; DESCRIPTION: Draws a red line from (140, 128) to (210, 223).
; PLAN: r0=140(x1), r1=128(y1), r2=210(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 128
LDI r2, 210
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
