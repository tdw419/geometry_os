; DESCRIPTION: Draws a orange border around the entire screen (a rectangle from 0,0 to 511,255).
; PLAN: r0=0(x), r1=0(y), r2=5(width), r3=255(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 5
LDI r3, 255
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
