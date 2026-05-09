; DESCRIPTION: Places a yellow 28x23 rectangle at position (12, 179).
; PLAN: r0=12(x), r1=179(y), r2=28(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 179
LDI r2, 28
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
