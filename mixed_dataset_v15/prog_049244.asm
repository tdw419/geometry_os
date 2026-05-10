; DESCRIPTION: Draws a green line from (239, 165) to (510, 189).
; PLAN: r0=239(x1), r1=165(y1), r2=510(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 165
LDI r2, 510
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
