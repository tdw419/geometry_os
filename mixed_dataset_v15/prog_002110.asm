; DESCRIPTION: Places a yellow 61x29 rectangle at position (85, 172).
; PLAN: r0=85(x), r1=172(y), r2=61(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 172
LDI r2, 61
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
