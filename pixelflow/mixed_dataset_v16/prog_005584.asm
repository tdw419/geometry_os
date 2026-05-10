; DESCRIPTION: Places a white 32x77 rectangle at position (217, 19).
; PLAN: r0=217(x), r1=19(y), r2=32(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 19
LDI r2, 32
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
