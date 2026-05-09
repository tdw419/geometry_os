; DESCRIPTION: Places a white 32x76 rectangle at position (395, 16).
; PLAN: r0=395(x), r1=16(y), r2=32(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 16
LDI r2, 32
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
