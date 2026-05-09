; DESCRIPTION: Places a yellow 54x98 rectangle at position (116, 69).
; PLAN: r0=116(x), r1=69(y), r2=54(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 69
LDI r2, 54
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
