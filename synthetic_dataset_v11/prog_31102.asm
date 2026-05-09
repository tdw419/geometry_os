; DESCRIPTION: Renders a orange box of size 46x115 starting at (11, 125).
; PLAN: r0=11(x), r1=125(y), r2=46(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 125
LDI r2, 46
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
