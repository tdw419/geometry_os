; DESCRIPTION: Draws a cyan rectangle at (152, 214) with width 44 and height 28.
; PLAN: r0=152(x), r1=214(y), r2=44(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 214
LDI r2, 44
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
