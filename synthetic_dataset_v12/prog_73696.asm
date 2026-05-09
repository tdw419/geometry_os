; DESCRIPTION: Composite: Renders a orange line between points (46, 159) and (327, 221) then Renders a white box of size 103x54 starting at (361, 88).
; PLAN: r0=46(x1), r1=159(y1), r2=327(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=361(x), r6=88(y), r7=103(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 159
LDI r2, 327
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 88
LDI r7, 103
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
