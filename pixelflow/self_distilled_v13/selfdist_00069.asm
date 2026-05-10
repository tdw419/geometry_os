; DESCRIPTION: Places a white 76x97 box at position (239, 182).
; PLAN: r0=239(x), r1=182(y), r2=76(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 182
LDI r2, 76
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
