; DESCRIPTION: Places a yellow 113x96 rectangle at position (48, 10).
; PLAN: r0=48(x), r1=10(y), r2=113(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 10
LDI r2, 113
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
