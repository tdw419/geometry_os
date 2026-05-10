; DESCRIPTION: Draws a cyan rectangle at (59, 152) with width 66 and height 49.
; PLAN: r0=59(x), r1=152(y), r2=66(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 152
LDI r2, 66
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
