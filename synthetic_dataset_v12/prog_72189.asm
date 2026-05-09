; DESCRIPTION: Places a black 27x95 rectangle at position (63, 49).
; PLAN: r0=63(x), r1=49(y), r2=27(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 49
LDI r2, 27
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
