; DESCRIPTION: Places a green 96x76 rectangle at position (56, 28).
; PLAN: r0=56(x), r1=28(y), r2=96(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 28
LDI r2, 96
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
