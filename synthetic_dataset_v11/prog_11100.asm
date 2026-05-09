; DESCRIPTION: Places a yellow 50x73 rectangle at position (43, 103).
; PLAN: r0=43(x), r1=103(y), r2=50(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 103
LDI r2, 50
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
