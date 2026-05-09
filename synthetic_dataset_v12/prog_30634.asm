; DESCRIPTION: Places a white 86x11 rectangle at position (296, 194).
; PLAN: r0=296(x), r1=194(y), r2=86(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 194
LDI r2, 86
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
