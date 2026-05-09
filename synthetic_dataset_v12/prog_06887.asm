; DESCRIPTION: Places a white 97x63 rectangle at position (173, 109).
; PLAN: r0=173(x), r1=109(y), r2=97(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 109
LDI r2, 97
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
