; DESCRIPTION: Places a white 64x53 rectangle at position (144, 40).
; PLAN: r0=144(x), r1=40(y), r2=64(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 40
LDI r2, 64
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
