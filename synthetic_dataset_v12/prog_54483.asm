; DESCRIPTION: Places a orange 82x32 rectangle at position (285, 136).
; PLAN: r0=285(x), r1=136(y), r2=82(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 136
LDI r2, 82
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
