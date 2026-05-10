; DESCRIPTION: Places a blue 85x116 rectangle at position (100, 21).
; PLAN: r0=100(x), r1=21(y), r2=85(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 21
LDI r2, 85
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
