; DESCRIPTION: Composite: Renders a green line between points (509, 40) and (25, 131) then Renders a black box of size 52x35 starting at (53, 54).
; PLAN: r0=509(x1), r1=40(y1), r2=25(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=54(y), r7=52(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 40
LDI r2, 25
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 54
LDI r7, 52
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
