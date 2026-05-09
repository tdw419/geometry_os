; DESCRIPTION: Places a green 94x19 rectangle at position (28, 76).
; PLAN: r0=28(x), r1=76(y), r2=94(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 76
LDI r2, 94
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
