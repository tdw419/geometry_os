; DESCRIPTION: Places a orange 29x109 rectangle at position (121, 23).
; PLAN: r0=121(x), r1=23(y), r2=29(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 23
LDI r2, 29
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
