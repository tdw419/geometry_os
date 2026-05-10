; DESCRIPTION: Draws a green line from (42, 194) to (165, 188).
; PLAN: r0=42(x1), r1=194(y1), r2=165(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 194
LDI r2, 165
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
