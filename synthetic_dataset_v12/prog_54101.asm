; DESCRIPTION: Draws a orange rectangle at (128, 146) with width 22 and height 86.
; PLAN: r0=128(x), r1=146(y), r2=22(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 146
LDI r2, 22
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
