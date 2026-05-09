; DESCRIPTION: Places a yellow 55x40 rectangle at position (253, 115).
; PLAN: r0=253(x), r1=115(y), r2=55(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 115
LDI r2, 55
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
