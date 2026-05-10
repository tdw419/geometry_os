; DESCRIPTION: Places a red 69x54 rectangle at position (25, 197).
; PLAN: r0=25(x), r1=197(y), r2=69(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 197
LDI r2, 69
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
