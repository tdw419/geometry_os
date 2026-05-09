; DESCRIPTION: Places a black 10x66 rectangle at position (150, 162).
; PLAN: r0=150(x), r1=162(y), r2=10(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 162
LDI r2, 10
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
