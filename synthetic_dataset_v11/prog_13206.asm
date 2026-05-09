; DESCRIPTION: Draws a cyan rectangle at (152, 56) with width 45 and height 47.
; PLAN: r0=152(x), r1=56(y), r2=45(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 56
LDI r2, 45
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
