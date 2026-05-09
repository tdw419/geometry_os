; DESCRIPTION: Places a white 63x53 rectangle at position (172, 48).
; PLAN: r0=172(x), r1=48(y), r2=63(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 48
LDI r2, 63
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
