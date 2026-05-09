; DESCRIPTION: Places a magenta 28x32 rectangle at position (320, 141).
; PLAN: r0=320(x), r1=141(y), r2=28(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 141
LDI r2, 28
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
