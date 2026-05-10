; DESCRIPTION: Renders a orange box of size 114x115 starting at (150, 134).
; PLAN: r0=150(x), r1=134(y), r2=114(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 134
LDI r2, 114
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
