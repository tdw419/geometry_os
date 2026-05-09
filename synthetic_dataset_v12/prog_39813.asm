; DESCRIPTION: Places a magenta 37x54 rectangle at position (34, 167).
; PLAN: r0=34(x), r1=167(y), r2=37(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 167
LDI r2, 37
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
