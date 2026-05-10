; DESCRIPTION: Places a yellow 82x69 rectangle at position (372, 114).
; PLAN: r0=372(x), r1=114(y), r2=82(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 114
LDI r2, 82
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
