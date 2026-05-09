; DESCRIPTION: Draws a cyan rectangle at (67, 0) with width 93 and height 59.
; PLAN: r0=67(x), r1=0(y), r2=93(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 0
LDI r2, 93
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
