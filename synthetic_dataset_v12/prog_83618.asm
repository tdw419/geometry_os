; DESCRIPTION: Places a orange 33x32 rectangle at position (430, 29).
; PLAN: r0=430(x), r1=29(y), r2=33(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 29
LDI r2, 33
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
