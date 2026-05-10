; DESCRIPTION: Composite: Draws a black rectangle at (240, 26) with width 10 and height 48 then Places a black line segment connecting (295, 128) to (352, 36).
; PLAN: r0=240(x), r1=26(y), r2=10(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=128(y1), r7=352(x2), r8=36(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 26
LDI r2, 10
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 128
LDI r7, 352
LDI r8, 36
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
