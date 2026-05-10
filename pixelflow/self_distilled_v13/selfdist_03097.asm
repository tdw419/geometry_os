; DESCRIPTION: Draws a orange rectangle at (307, 196) with width 45 and height 77.
; PLAN: r0=307(x), r1=196(y), r2=45(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 196
LDI r2, 45
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
