; DESCRIPTION: Places a yellow 16x23 rectangle at position (65, 203).
; PLAN: r0=65(x), r1=203(y), r2=16(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 203
LDI r2, 16
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
