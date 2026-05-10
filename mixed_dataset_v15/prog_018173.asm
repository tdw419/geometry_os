; DESCRIPTION: Composite: Places a green dot at position (310, 51) then Draws a orange rectangle at (288, 86) with width 120 and height 42.
; PLAN: r0=310(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=86(y), r7=120(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 288
LDI r6, 86
LDI r7, 120
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
