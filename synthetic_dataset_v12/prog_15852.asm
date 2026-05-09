; DESCRIPTION: Places a magenta 50x54 rectangle at position (420, 98).
; PLAN: r0=420(x), r1=98(y), r2=50(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 98
LDI r2, 50
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
