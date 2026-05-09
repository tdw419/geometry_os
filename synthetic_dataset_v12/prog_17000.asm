; DESCRIPTION: Places a red 10x10 rectangle at position (79, 191).
; PLAN: r0=79(x), r1=191(y), r2=10(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 191
LDI r2, 10
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
