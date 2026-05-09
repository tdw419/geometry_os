; DESCRIPTION: Places a magenta 40x20 rectangle at position (173, 56).
; PLAN: r0=173(x), r1=56(y), r2=40(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 56
LDI r2, 40
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
