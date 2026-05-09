; DESCRIPTION: Places a white 64x111 rectangle at position (253, 104).
; PLAN: r0=253(x), r1=104(y), r2=64(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 104
LDI r2, 64
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
