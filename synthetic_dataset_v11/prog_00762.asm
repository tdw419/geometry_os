; DESCRIPTION: Draws a cyan rectangle at (165, 0) with width 87 and height 60.
; PLAN: r0=165(x), r1=0(y), r2=87(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 0
LDI r2, 87
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
