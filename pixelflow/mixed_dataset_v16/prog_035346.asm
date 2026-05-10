; DESCRIPTION: Places a magenta 79x64 rectangle at position (249, 184).
; PLAN: r0=249(x), r1=184(y), r2=79(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 184
LDI r2, 79
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
