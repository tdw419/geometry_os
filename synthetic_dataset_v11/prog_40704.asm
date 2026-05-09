; DESCRIPTION: Places a orange 63x73 rectangle at position (165, 48).
; PLAN: r0=165(x), r1=48(y), r2=63(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 48
LDI r2, 63
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
