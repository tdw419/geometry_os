; DESCRIPTION: Composite: Places a cyan line segment connecting (185, 204) to (459, 230) then Places a orange 92x37 rectangle at position (167, 3).
; PLAN: r0=185(x1), r1=204(y1), r2=459(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=3(y), r7=92(width), r8=37(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 204
LDI r2, 459
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 3
LDI r7, 92
LDI r8, 37
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
