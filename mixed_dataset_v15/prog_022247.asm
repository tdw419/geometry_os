; DESCRIPTION: Places a orange 113x44 rectangle at position (170, 8).
; PLAN: r0=170(x), r1=8(y), r2=113(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 8
LDI r2, 113
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
