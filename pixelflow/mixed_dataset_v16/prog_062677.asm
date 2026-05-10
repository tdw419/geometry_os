; DESCRIPTION: Places a blue 27x28 rectangle at position (77, 84).
; PLAN: r0=77(x), r1=84(y), r2=27(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 84
LDI r2, 27
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
