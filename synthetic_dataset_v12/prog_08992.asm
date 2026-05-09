; DESCRIPTION: Composite: Places a purple 29x104 rectangle at position (40, 24) then Places a red dot at position (188, 187).
; PLAN: r0=40(x), r1=24(y), r2=29(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=187(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 24
LDI r2, 29
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 187
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
