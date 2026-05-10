; DESCRIPTION: Composite: Draws a black line from (91, 23) to (108, 106) then Places a red 101x45 rectangle at position (30, 108).
; PLAN: r0=91(x1), r1=23(y1), r2=108(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=108(y), r7=101(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 23
LDI r2, 108
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 108
LDI r7, 101
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
