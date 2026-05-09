; DESCRIPTION: Places a yellow 62x80 rectangle at position (121, 68).
; PLAN: r0=121(x), r1=68(y), r2=62(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 68
LDI r2, 62
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
