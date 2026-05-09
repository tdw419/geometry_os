; DESCRIPTION: Places a red 34x43 rectangle at position (332, 59).
; PLAN: r0=332(x), r1=59(y), r2=34(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 59
LDI r2, 34
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
