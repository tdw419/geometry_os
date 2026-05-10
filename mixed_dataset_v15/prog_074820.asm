; DESCRIPTION: Composite: Places a red 32x15 rectangle at position (253, 41) then Renders a blue line between points (197, 144) and (268, 207).
; PLAN: r0=253(x), r1=41(y), r2=32(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x1), r6=144(y1), r7=268(x2), r8=207(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 41
LDI r2, 32
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 144
LDI r7, 268
LDI r8, 207
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
