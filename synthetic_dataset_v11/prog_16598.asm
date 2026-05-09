; DESCRIPTION: Places a black 107x19 rectangle at position (20, 50).
; PLAN: r0=20(x), r1=50(y), r2=107(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 50
LDI r2, 107
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
