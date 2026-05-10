; DESCRIPTION: Places a orange 45x120 rectangle at position (59, 125).
; PLAN: r0=59(x), r1=125(y), r2=45(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 125
LDI r2, 45
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
