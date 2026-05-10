; DESCRIPTION: Composite: Places a magenta circle of radius 59 at center (215, 86) then Renders a green line between points (316, 252) and (292, 212).
; PLAN: r0=215(x), r1=86(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x1), r6=252(y1), r7=292(x2), r8=212(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 86
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 252
LDI r7, 292
LDI r8, 212
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
