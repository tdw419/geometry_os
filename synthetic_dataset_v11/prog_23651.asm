; DESCRIPTION: Places a magenta 16x46 rectangle at position (54, 41).
; PLAN: r0=54(x), r1=41(y), r2=16(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 41
LDI r2, 16
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
