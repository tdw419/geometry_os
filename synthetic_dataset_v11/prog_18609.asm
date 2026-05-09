; DESCRIPTION: Places a yellow 96x20 rectangle at position (90, 155).
; PLAN: r0=90(x), r1=155(y), r2=96(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 155
LDI r2, 96
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
