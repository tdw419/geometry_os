; DESCRIPTION: Places a magenta 29x64 rectangle at position (33, 20).
; PLAN: r0=33(x), r1=20(y), r2=29(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 20
LDI r2, 29
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
