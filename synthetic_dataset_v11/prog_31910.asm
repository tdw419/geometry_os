; DESCRIPTION: Places a yellow 28x93 rectangle at position (160, 135).
; PLAN: r0=160(x), r1=135(y), r2=28(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 135
LDI r2, 28
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
