; DESCRIPTION: Places a red 59x113 rectangle at position (30, 73).
; PLAN: r0=30(x), r1=73(y), r2=59(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 73
LDI r2, 59
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
