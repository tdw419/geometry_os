; DESCRIPTION: Places a magenta 64x11 rectangle at position (415, 167).
; PLAN: r0=415(x), r1=167(y), r2=64(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 167
LDI r2, 64
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
