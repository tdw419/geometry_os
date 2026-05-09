; DESCRIPTION: Places a magenta 41x91 rectangle at position (370, 116).
; PLAN: r0=370(x), r1=116(y), r2=41(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 116
LDI r2, 41
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
