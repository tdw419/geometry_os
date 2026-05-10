; DESCRIPTION: Composite: Draws a green line from (336, 163) to (122, 125) then Places a black 16x16 rectangle at position (156, 215).
; PLAN: r0=336(x1), r1=163(y1), r2=122(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=215(y), r7=16(width), r8=16(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 163
LDI r2, 122
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 215
LDI r7, 16
LDI r8, 16
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
