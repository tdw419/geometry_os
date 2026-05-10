; DESCRIPTION: Composite: Places a magenta 69x115 rectangle at position (356, 104) then Places a cyan line segment connecting (20, 25) to (265, 115).
; PLAN: r0=356(x), r1=104(y), r2=69(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x1), r6=25(y1), r7=265(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 104
LDI r2, 69
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 25
LDI r7, 265
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
