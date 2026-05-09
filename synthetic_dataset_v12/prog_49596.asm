; DESCRIPTION: Places a orange 109x65 rectangle at position (219, 134).
; PLAN: r0=219(x), r1=134(y), r2=109(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 134
LDI r2, 109
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
