; DESCRIPTION: Places a blue 43x46 rectangle at position (291, 130).
; PLAN: r0=291(x), r1=130(y), r2=43(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 130
LDI r2, 43
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
