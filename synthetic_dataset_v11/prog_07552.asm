; DESCRIPTION: Places a orange 77x98 rectangle at position (77, 20).
; PLAN: r0=77(x), r1=20(y), r2=77(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 20
LDI r2, 77
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
