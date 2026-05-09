; DESCRIPTION: Places a black 72x18 rectangle at position (182, 21).
; PLAN: r0=182(x), r1=21(y), r2=72(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 21
LDI r2, 72
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
