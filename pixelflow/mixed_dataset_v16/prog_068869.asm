; DESCRIPTION: Places a white 28x35 box at position (173, 108).
; PLAN: r0=173(x), r1=108(y), r2=28(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 108
LDI r2, 28
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
