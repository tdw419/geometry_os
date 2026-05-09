; DESCRIPTION: Composite: Places a green dot at position (210, 198) then Draws a orange rectangle at (166, 51) with width 59 and height 22.
; PLAN: r0=210(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=51(y), r7=59(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 166
LDI r6, 51
LDI r7, 59
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
