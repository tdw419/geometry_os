; DESCRIPTION: Places a magenta 16x99 rectangle at position (120, 121).
; PLAN: r0=120(x), r1=121(y), r2=16(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 121
LDI r2, 16
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
