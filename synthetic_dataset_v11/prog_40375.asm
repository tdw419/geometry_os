; DESCRIPTION: Places a yellow 29x47 rectangle at position (179, 144).
; PLAN: r0=179(x), r1=144(y), r2=29(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 144
LDI r2, 29
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
