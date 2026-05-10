; DESCRIPTION: Places a black 50x96 rectangle at position (418, 112).
; PLAN: r0=418(x), r1=112(y), r2=50(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 112
LDI r2, 50
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
