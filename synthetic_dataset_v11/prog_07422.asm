; DESCRIPTION: Places a white 64x90 rectangle at position (172, 13).
; PLAN: r0=172(x), r1=13(y), r2=64(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 13
LDI r2, 64
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
