; DESCRIPTION: Places a magenta 35x64 rectangle at position (21, 173).
; PLAN: r0=21(x), r1=173(y), r2=35(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 173
LDI r2, 35
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
