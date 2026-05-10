; DESCRIPTION: Places a orange 25x103 rectangle at position (192, 129).
; PLAN: r0=192(x), r1=129(y), r2=25(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 129
LDI r2, 25
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
