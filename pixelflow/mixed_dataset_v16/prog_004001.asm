; DESCRIPTION: Places a white 70x32 rectangle at position (293, 8).
; PLAN: r0=293(x), r1=8(y), r2=70(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 8
LDI r2, 70
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
