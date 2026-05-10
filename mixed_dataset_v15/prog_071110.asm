; DESCRIPTION: Draws a red line from (200, 130) to (239, 190).
; PLAN: r0=200(x1), r1=130(y1), r2=239(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 130
LDI r2, 239
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
