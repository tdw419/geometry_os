; DESCRIPTION: Places a orange 92x107 rectangle at position (32, 12).
; PLAN: r0=32(x), r1=12(y), r2=92(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 12
LDI r2, 92
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
