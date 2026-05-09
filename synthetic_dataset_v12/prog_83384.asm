; DESCRIPTION: Places a orange 11x103 rectangle at position (460, 44).
; PLAN: r0=460(x), r1=44(y), r2=11(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 44
LDI r2, 11
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
