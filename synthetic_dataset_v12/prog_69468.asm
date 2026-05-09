; DESCRIPTION: Places a orange 20x96 rectangle at position (54, 20).
; PLAN: r0=54(x), r1=20(y), r2=20(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 20
LDI r2, 20
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
