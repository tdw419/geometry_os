; DESCRIPTION: Composite: Places a red 90x12 rectangle at position (224, 24) then Places a cyan line segment connecting (342, 165) to (450, 198).
; PLAN: r0=224(x), r1=24(y), r2=90(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=165(y1), r7=450(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 24
LDI r2, 90
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 165
LDI r7, 450
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
