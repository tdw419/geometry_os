; DESCRIPTION: Places a magenta 54x39 rectangle at position (129, 184).
; PLAN: r0=129(x), r1=184(y), r2=54(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 184
LDI r2, 54
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
