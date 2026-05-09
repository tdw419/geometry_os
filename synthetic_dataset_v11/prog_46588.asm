; DESCRIPTION: Places a orange 56x18 rectangle at position (88, 228).
; PLAN: r0=88(x), r1=228(y), r2=56(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 228
LDI r2, 56
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
