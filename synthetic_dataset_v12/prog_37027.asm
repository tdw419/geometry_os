; DESCRIPTION: Places a magenta 26x54 rectangle at position (138, 174).
; PLAN: r0=138(x), r1=174(y), r2=26(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 174
LDI r2, 26
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
