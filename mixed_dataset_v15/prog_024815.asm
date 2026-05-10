; DESCRIPTION: Places a magenta 36x60 rectangle at position (333, 173).
; PLAN: r0=333(x), r1=173(y), r2=36(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 173
LDI r2, 36
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
