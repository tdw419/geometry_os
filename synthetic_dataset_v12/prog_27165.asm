; DESCRIPTION: Places a white 52x67 rectangle at position (296, 26).
; PLAN: r0=296(x), r1=26(y), r2=52(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 26
LDI r2, 52
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
