; DESCRIPTION: Places a orange 80x28 rectangle at position (74, 210).
; PLAN: r0=74(x), r1=210(y), r2=80(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 210
LDI r2, 80
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
