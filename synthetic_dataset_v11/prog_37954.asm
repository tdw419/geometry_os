; DESCRIPTION: Places a orange 54x61 rectangle at position (6, 65).
; PLAN: r0=6(x), r1=65(y), r2=54(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 65
LDI r2, 54
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
