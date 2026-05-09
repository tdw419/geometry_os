; DESCRIPTION: Composite: Places a purple dot at position (427, 123) then Places a blue 47x88 rectangle at position (108, 58).
; PLAN: r0=427(x), r1=123(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=58(y), r7=47(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 123
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 58
LDI r7, 47
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
