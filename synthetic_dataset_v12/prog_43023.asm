; DESCRIPTION: Places a orange 10x56 rectangle at position (246, 82).
; PLAN: r0=246(x), r1=82(y), r2=10(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 82
LDI r2, 10
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
