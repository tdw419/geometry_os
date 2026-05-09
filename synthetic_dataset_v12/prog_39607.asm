; DESCRIPTION: Places a orange 93x48 rectangle at position (107, 181).
; PLAN: r0=107(x), r1=181(y), r2=93(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 181
LDI r2, 93
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
