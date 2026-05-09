; DESCRIPTION: Places a orange 42x20 rectangle at position (246, 185).
; PLAN: r0=246(x), r1=185(y), r2=42(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 185
LDI r2, 42
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
