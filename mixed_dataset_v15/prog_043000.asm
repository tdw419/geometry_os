; DESCRIPTION: Composite: Renders a white line between points (425, 203) and (95, 231) then Places a cyan 118x68 rectangle at position (164, 70).
; PLAN: r0=425(x1), r1=203(y1), r2=95(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=70(y), r7=118(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 203
LDI r2, 95
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 70
LDI r7, 118
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
