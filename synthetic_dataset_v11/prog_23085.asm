; DESCRIPTION: Places a magenta 35x97 rectangle at position (202, 95).
; PLAN: r0=202(x), r1=95(y), r2=35(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 95
LDI r2, 35
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
