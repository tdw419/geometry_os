; DESCRIPTION: Places a yellow 19x19 rectangle at position (33, 165).
; PLAN: r0=33(x), r1=165(y), r2=19(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 165
LDI r2, 19
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
