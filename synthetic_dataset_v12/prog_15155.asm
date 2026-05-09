; DESCRIPTION: Draws a cyan rectangle at (2, 127) with width 60 and height 45.
; PLAN: r0=2(x), r1=127(y), r2=60(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 127
LDI r2, 60
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
