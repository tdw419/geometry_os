; DESCRIPTION: Places a black 10x16 rectangle at position (109, 127).
; PLAN: r0=109(x), r1=127(y), r2=10(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 127
LDI r2, 10
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
