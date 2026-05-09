; DESCRIPTION: Places a white 114x55 rectangle at position (204, 129).
; PLAN: r0=204(x), r1=129(y), r2=114(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 129
LDI r2, 114
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
