; DESCRIPTION: Draws a blue rectangle at (401, 117) with width 13 and height 39.
; PLAN: r0=401(x), r1=117(y), r2=13(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 117
LDI r2, 13
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
