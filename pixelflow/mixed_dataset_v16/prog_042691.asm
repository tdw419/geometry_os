; DESCRIPTION: Places a cyan 77x82 rectangle at position (288, 145).
; PLAN: r0=288(x), r1=145(y), r2=77(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 145
LDI r2, 77
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
