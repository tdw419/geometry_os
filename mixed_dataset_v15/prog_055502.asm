; DESCRIPTION: Places a orange 85x14 rectangle at position (340, 217).
; PLAN: r0=340(x), r1=217(y), r2=85(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 217
LDI r2, 85
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
