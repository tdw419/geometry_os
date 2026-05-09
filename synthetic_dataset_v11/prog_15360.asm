; DESCRIPTION: Places a white 35x61 rectangle at position (29, 48).
; PLAN: r0=29(x), r1=48(y), r2=35(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 48
LDI r2, 35
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
