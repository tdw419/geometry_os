; DESCRIPTION: Draws a orange rectangle at (453, 168) with width 21 and height 40.
; PLAN: r0=453(x), r1=168(y), r2=21(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 168
LDI r2, 21
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
