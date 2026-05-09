; DESCRIPTION: Places a orange 45x107 rectangle at position (182, 107).
; PLAN: r0=182(x), r1=107(y), r2=45(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 107
LDI r2, 45
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
