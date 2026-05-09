; DESCRIPTION: Places a green 28x31 rectangle at position (28, 0).
; PLAN: r0=28(x), r1=0(y), r2=28(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 0
LDI r2, 28
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
