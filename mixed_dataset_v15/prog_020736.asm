; DESCRIPTION: Draws a yellow line from (294, 225) to (62, 190).
; PLAN: r0=294(x1), r1=225(y1), r2=62(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 225
LDI r2, 62
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
