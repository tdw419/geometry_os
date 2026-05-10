; DESCRIPTION: Composite: Places a yellow 39x28 rectangle at position (362, 209) then Places a orange line segment connecting (202, 123) to (198, 110).
; PLAN: r0=362(x), r1=209(y), r2=39(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=123(y1), r7=198(x2), r8=110(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 362
LDI r1, 209
LDI r2, 39
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 123
LDI r7, 198
LDI r8, 110
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
