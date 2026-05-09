; DESCRIPTION: Places a blue 34x91 rectangle at position (28, 19).
; PLAN: r0=28(x), r1=19(y), r2=34(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 19
LDI r2, 34
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
