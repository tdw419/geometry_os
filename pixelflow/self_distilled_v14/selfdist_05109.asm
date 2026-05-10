; DESCRIPTION: Draws a orange rectangle at (294, 114) with width 42 and height 59.
; PLAN: r0=294(x), r1=114(y), r2=42(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 114
LDI r2, 42
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
