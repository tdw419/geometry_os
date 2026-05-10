; DESCRIPTION: Places a black 85x58 rectangle at position (298, 1).
; PLAN: r0=298(x), r1=1(y), r2=85(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 1
LDI r2, 85
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
