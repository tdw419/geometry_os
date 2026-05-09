; DESCRIPTION: Places a white 76x112 rectangle at position (239, 121).
; PLAN: r0=239(x), r1=121(y), r2=76(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 121
LDI r2, 76
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
