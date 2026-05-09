; DESCRIPTION: Draws a yellow line from (492, 157) to (238, 42).
; PLAN: r0=492(x1), r1=157(y1), r2=238(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 157
LDI r2, 238
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
