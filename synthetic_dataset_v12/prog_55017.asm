; DESCRIPTION: Places a orange 43x32 rectangle at position (458, 52).
; PLAN: r0=458(x), r1=52(y), r2=43(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 52
LDI r2, 43
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
