; DESCRIPTION: Draws a orange rectangle at (486, 115) with width 16 and height 18.
; PLAN: r0=486(x), r1=115(y), r2=16(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 115
LDI r2, 16
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
