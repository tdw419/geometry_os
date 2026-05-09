; DESCRIPTION: Places a orange 22x113 rectangle at position (25, 4).
; PLAN: r0=25(x), r1=4(y), r2=22(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 4
LDI r2, 22
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
