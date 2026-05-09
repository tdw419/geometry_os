; DESCRIPTION: Draws a orange rectangle at (439, 197) with width 57 and height 40.
; PLAN: r0=439(x), r1=197(y), r2=57(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 197
LDI r2, 57
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
