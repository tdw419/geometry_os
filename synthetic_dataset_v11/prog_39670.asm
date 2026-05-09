; DESCRIPTION: Places a white 37x92 rectangle at position (25, 64).
; PLAN: r0=25(x), r1=64(y), r2=37(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 64
LDI r2, 37
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
