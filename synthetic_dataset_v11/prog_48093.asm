; DESCRIPTION: Places a black 103x12 rectangle at position (20, 33).
; PLAN: r0=20(x), r1=33(y), r2=103(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 33
LDI r2, 103
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
