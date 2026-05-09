; DESCRIPTION: Places a white 63x48 rectangle at position (372, 81).
; PLAN: r0=372(x), r1=81(y), r2=63(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 81
LDI r2, 63
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
