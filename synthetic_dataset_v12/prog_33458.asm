; DESCRIPTION: Places a white 25x100 rectangle at position (253, 138).
; PLAN: r0=253(x), r1=138(y), r2=25(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 138
LDI r2, 25
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
