; DESCRIPTION: Places a yellow 101x116 rectangle at position (268, 104).
; PLAN: r0=268(x), r1=104(y), r2=101(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 104
LDI r2, 101
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
