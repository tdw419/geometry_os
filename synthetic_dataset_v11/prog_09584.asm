; DESCRIPTION: Places a black 55x52 rectangle at position (20, 18).
; PLAN: r0=20(x), r1=18(y), r2=55(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 18
LDI r2, 55
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
