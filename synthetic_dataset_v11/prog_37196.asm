; DESCRIPTION: Places a yellow 43x36 rectangle at position (154, 103).
; PLAN: r0=154(x), r1=103(y), r2=43(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 103
LDI r2, 43
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
