; DESCRIPTION: Places a white 43x96 rectangle at position (161, 12).
; PLAN: r0=161(x), r1=12(y), r2=43(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 12
LDI r2, 43
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
