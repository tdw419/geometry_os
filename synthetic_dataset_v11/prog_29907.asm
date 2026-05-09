; DESCRIPTION: Draws a cyan rectangle at (154, 42) with width 15 and height 59.
; PLAN: r0=154(x), r1=42(y), r2=15(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 42
LDI r2, 15
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
