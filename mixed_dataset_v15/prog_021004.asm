; DESCRIPTION: Places a black 73x27 rectangle at position (402, 50).
; PLAN: r0=402(x), r1=50(y), r2=73(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 50
LDI r2, 73
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
