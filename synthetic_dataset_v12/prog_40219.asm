; DESCRIPTION: Composite: Draws a orange rectangle at (169, 3) with width 47 and height 77 then Places a blue dot at position (280, 22).
; PLAN: r0=169(x), r1=3(y), r2=47(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 3
LDI r2, 47
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
