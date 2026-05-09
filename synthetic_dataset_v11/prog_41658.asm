; DESCRIPTION: Draws a cyan rectangle at (102, 127) with width 42 and height 67.
; PLAN: r0=102(x), r1=127(y), r2=42(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 127
LDI r2, 42
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
