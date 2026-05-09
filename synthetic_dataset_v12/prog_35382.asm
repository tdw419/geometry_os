; DESCRIPTION: Places a orange 24x59 rectangle at position (12, 73).
; PLAN: r0=12(x), r1=73(y), r2=24(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 73
LDI r2, 24
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
