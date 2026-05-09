; DESCRIPTION: Renders a orange box of size 57x67 starting at (91, 75).
; PLAN: r0=91(x), r1=75(y), r2=57(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 75
LDI r2, 57
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
