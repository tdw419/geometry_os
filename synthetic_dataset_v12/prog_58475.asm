; DESCRIPTION: Places a blue 27x16 rectangle at position (36, 25).
; PLAN: r0=36(x), r1=25(y), r2=27(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 25
LDI r2, 27
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
