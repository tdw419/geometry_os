; DESCRIPTION: Draws a red line from (239, 165) to (21, 60).
; PLAN: r0=239(x1), r1=165(y1), r2=21(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 165
LDI r2, 21
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
