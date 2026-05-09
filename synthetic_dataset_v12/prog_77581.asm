; DESCRIPTION: Places a green 69x46 rectangle at position (183, 162).
; PLAN: r0=183(x), r1=162(y), r2=69(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 162
LDI r2, 69
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
