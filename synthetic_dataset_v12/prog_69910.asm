; DESCRIPTION: Places a cyan 69x40 rectangle at position (159, 9).
; PLAN: r0=159(x), r1=9(y), r2=69(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 9
LDI r2, 69
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
