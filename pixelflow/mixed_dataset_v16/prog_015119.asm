; DESCRIPTION: Places a white 64x88 rectangle at position (401, 65).
; PLAN: r0=401(x), r1=65(y), r2=64(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 65
LDI r2, 64
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
