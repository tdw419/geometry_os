; DESCRIPTION: Places a white 95x40 rectangle at position (397, 147).
; PLAN: r0=397(x), r1=147(y), r2=95(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 147
LDI r2, 95
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
