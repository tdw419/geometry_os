; DESCRIPTION: Places a yellow 27x21 rectangle at position (256, 74).
; PLAN: r0=256(x), r1=74(y), r2=27(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 74
LDI r2, 27
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
