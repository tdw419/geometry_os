; DESCRIPTION: Draws a cyan rectangle at (120, 67) with width 21 and height 16.
; PLAN: r0=120(x), r1=67(y), r2=21(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 67
LDI r2, 21
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
