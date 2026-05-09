; DESCRIPTION: Renders a white box of size 86x67 starting at (267, 59).
; PLAN: r0=267(x), r1=59(y), r2=86(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 59
LDI r2, 86
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
