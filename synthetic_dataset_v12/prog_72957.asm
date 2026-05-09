; DESCRIPTION: Places a blue 55x17 rectangle at position (399, 183).
; PLAN: r0=399(x), r1=183(y), r2=55(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 183
LDI r2, 55
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
