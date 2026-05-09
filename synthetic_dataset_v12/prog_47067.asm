; DESCRIPTION: Places a purple 66x28 rectangle at position (421, 223).
; PLAN: r0=421(x), r1=223(y), r2=66(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 223
LDI r2, 66
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
