; DESCRIPTION: Draws a orange rectangle at (150, 93) with width 21 and height 32.
; PLAN: r0=150(x), r1=93(y), r2=21(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 93
LDI r2, 21
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
