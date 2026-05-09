; DESCRIPTION: Places a blue 59x64 rectangle at position (340, 64).
; PLAN: r0=340(x), r1=64(y), r2=59(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 64
LDI r2, 59
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
