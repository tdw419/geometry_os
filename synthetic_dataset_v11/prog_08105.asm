; DESCRIPTION: Draws a cyan rectangle at (102, 152) with width 28 and height 63.
; PLAN: r0=102(x), r1=152(y), r2=28(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 152
LDI r2, 28
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
