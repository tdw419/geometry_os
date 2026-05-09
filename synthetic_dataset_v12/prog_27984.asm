; DESCRIPTION: Places a yellow 106x69 rectangle at position (306, 23).
; PLAN: r0=306(x), r1=23(y), r2=106(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 23
LDI r2, 106
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
