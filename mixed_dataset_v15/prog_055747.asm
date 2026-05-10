; DESCRIPTION: Composite: Draws a black line from (61, 13) to (114, 75) then Renders a black box of size 16x50 starting at (236, 100).
; PLAN: r0=61(x1), r1=13(y1), r2=114(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=100(y), r7=16(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 13
LDI r2, 114
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 100
LDI r7, 16
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
