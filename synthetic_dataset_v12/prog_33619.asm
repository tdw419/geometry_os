; DESCRIPTION: Composite: Places a green 13x18 rectangle at position (116, 82) then Renders a orange line between points (158, 225) and (148, 171).
; PLAN: r0=116(x), r1=82(y), r2=13(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=225(y1), r7=148(x2), r8=171(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 82
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 225
LDI r7, 148
LDI r8, 171
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
