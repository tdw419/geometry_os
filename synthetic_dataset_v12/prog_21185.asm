; DESCRIPTION: Composite: Renders a green box of size 26x102 starting at (369, 119) then Places a red dot at position (219, 207).
; PLAN: r0=369(x), r1=119(y), r2=26(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=207(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 119
LDI r2, 26
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 207
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
