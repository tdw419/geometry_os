; DESCRIPTION: Draws a orange rectangle at (365, 80) with width 89 and height 24.
; PLAN: r0=365(x), r1=80(y), r2=89(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 80
LDI r2, 89
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
