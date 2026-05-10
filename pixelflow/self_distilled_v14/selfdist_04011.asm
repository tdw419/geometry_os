; DESCRIPTION: Places a white 52x56 box at position (239, 149).
; PLAN: r0=239(x), r1=149(y), r2=52(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 149
LDI r2, 52
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
