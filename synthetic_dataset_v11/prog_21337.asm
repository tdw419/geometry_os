; DESCRIPTION: Places a orange 16x33 rectangle at position (182, 3).
; PLAN: r0=182(x), r1=3(y), r2=16(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 16
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
