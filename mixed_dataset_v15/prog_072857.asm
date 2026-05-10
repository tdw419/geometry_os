; DESCRIPTION: Places a magenta 36x28 rectangle at position (173, 83).
; PLAN: r0=173(x), r1=83(y), r2=36(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 83
LDI r2, 36
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
