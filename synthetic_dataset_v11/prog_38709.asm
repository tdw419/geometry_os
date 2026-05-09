; DESCRIPTION: Places a black 52x56 rectangle at position (154, 159).
; PLAN: r0=154(x), r1=159(y), r2=52(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 159
LDI r2, 52
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
