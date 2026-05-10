; DESCRIPTION: Places a magenta 95x26 rectangle at position (65, 170).
; PLAN: r0=65(x), r1=170(y), r2=95(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 170
LDI r2, 95
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
