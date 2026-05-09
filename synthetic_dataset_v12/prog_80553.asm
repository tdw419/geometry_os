; DESCRIPTION: Composite: Places a white 108x115 rectangle at position (179, 39) then Renders a yellow line between points (209, 212) and (163, 70).
; PLAN: r0=179(x), r1=39(y), r2=108(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=212(y1), r7=163(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 39
LDI r2, 108
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 212
LDI r7, 163
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
