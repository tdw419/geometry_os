; DESCRIPTION: Places a green 28x96 rectangle at position (283, 18).
; PLAN: r0=283(x), r1=18(y), r2=28(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 18
LDI r2, 28
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
