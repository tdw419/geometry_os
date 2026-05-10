; DESCRIPTION: Places a blue 44x32 rectangle at position (173, 81).
; PLAN: r0=173(x), r1=81(y), r2=44(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 81
LDI r2, 44
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
