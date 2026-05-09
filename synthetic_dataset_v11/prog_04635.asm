; DESCRIPTION: Draws a white line from (146, 157) to (192, 202).
; PLAN: r0=146(x1), r1=157(y1), r2=192(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 157
LDI r2, 192
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
