; DESCRIPTION: Places a white 96x62 rectangle at position (256, 19).
; PLAN: r0=256(x), r1=19(y), r2=96(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 19
LDI r2, 96
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
