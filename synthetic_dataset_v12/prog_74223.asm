; DESCRIPTION: Places a black 55x47 rectangle at position (399, 7).
; PLAN: r0=399(x), r1=7(y), r2=55(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 7
LDI r2, 55
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
