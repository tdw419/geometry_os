; DESCRIPTION: Places a yellow 96x27 rectangle at position (20, 118).
; PLAN: r0=20(x), r1=118(y), r2=96(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 118
LDI r2, 96
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
