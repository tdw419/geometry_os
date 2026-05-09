; DESCRIPTION: Places a orange 69x86 rectangle at position (300, 63).
; PLAN: r0=300(x), r1=63(y), r2=69(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 63
LDI r2, 69
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
