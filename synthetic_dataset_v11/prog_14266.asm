; DESCRIPTION: Places a white 55x14 rectangle at position (191, 5).
; PLAN: r0=191(x), r1=5(y), r2=55(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 5
LDI r2, 55
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
