; DESCRIPTION: Draws a cyan rectangle at (198, 65) with width 74 and height 72.
; PLAN: r0=198(x), r1=65(y), r2=74(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 65
LDI r2, 74
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
