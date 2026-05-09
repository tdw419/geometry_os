; DESCRIPTION: Places a magenta 54x40 rectangle at position (364, 95).
; PLAN: r0=364(x), r1=95(y), r2=54(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 95
LDI r2, 54
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
