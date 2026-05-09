; DESCRIPTION: Draws a cyan rectangle at (160, 146) with width 67 and height 90.
; PLAN: r0=160(x), r1=146(y), r2=67(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 146
LDI r2, 67
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
