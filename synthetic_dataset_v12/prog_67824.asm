; DESCRIPTION: Renders a orange box of size 73x53 starting at (344, 37).
; PLAN: r0=344(x), r1=37(y), r2=73(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 37
LDI r2, 73
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
