; DESCRIPTION: Places a yellow 16x117 rectangle at position (57, 138).
; PLAN: r0=57(x), r1=138(y), r2=16(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 138
LDI r2, 16
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
