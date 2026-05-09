; DESCRIPTION: Places a blue 27x15 rectangle at position (121, 0).
; PLAN: r0=121(x), r1=0(y), r2=27(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 0
LDI r2, 27
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
