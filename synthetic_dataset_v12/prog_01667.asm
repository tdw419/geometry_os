; DESCRIPTION: Places a black 56x50 rectangle at position (184, 3).
; PLAN: r0=184(x), r1=3(y), r2=56(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 3
LDI r2, 56
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
