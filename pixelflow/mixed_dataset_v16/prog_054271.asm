; DESCRIPTION: Places a orange 25x120 rectangle at position (306, 9).
; PLAN: r0=306(x), r1=9(y), r2=25(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 9
LDI r2, 25
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
