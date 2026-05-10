; DESCRIPTION: Renders a orange box of size 73x113 starting at (307, 5).
; PLAN: r0=307(x), r1=5(y), r2=73(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 5
LDI r2, 73
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
