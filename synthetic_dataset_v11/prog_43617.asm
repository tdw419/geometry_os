; DESCRIPTION: Places a orange 22x81 rectangle at position (126, 174).
; PLAN: r0=126(x), r1=174(y), r2=22(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 174
LDI r2, 22
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
