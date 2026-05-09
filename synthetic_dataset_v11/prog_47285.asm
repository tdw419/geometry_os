; DESCRIPTION: Draws a cyan rectangle at (59, 66) with width 82 and height 60.
; PLAN: r0=59(x), r1=66(y), r2=82(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 66
LDI r2, 82
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
