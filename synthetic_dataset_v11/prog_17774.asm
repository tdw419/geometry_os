; DESCRIPTION: Places a yellow 44x38 rectangle at position (101, 103).
; PLAN: r0=101(x), r1=103(y), r2=44(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 103
LDI r2, 44
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
