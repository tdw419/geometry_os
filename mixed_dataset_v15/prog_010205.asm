; DESCRIPTION: Places a red 49x24 rectangle at position (370, 56).
; PLAN: r0=370(x), r1=56(y), r2=49(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 56
LDI r2, 49
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
