; DESCRIPTION: Places a orange 46x74 rectangle at position (5, 7).
; PLAN: r0=5(x), r1=7(y), r2=46(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 7
LDI r2, 46
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
