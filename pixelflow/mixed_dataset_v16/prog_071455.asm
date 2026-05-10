; DESCRIPTION: Renders a white box of size 68x87 starting at (291, 13).
; PLAN: r0=291(x), r1=13(y), r2=68(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 13
LDI r2, 68
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
