; DESCRIPTION: Draws a cyan line from (244, 123) to (307, 189).
; PLAN: r0=244(x1), r1=123(y1), r2=307(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 123
LDI r2, 307
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
