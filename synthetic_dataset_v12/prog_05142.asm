; DESCRIPTION: Places a blue 26x16 rectangle at position (99, 174).
; PLAN: r0=99(x), r1=174(y), r2=26(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 174
LDI r2, 26
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
