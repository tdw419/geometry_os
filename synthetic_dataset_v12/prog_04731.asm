; DESCRIPTION: Composite: Draws a orange rectangle at (129, 129) with width 20 and height 98 then Places a cyan dot at position (9, 100).
; PLAN: r0=129(x), r1=129(y), r2=20(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x), r6=100(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 129
LDI r1, 129
LDI r2, 20
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 100
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
