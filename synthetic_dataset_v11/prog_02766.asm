; DESCRIPTION: Places a black 106x117 rectangle at position (50, 73).
; PLAN: r0=50(x), r1=73(y), r2=106(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 73
LDI r2, 106
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
