; DESCRIPTION: Composite: Places a purple dot at position (70, 58) then Draws a black rectangle at (117, 18) with width 74 and height 13.
; PLAN: r0=70(x), r1=58(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=18(y), r7=74(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 58
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 18
LDI r7, 74
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
