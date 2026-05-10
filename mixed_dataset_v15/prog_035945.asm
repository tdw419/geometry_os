; DESCRIPTION: Places a yellow 95x103 rectangle at position (412, 141).
; PLAN: r0=412(x), r1=141(y), r2=95(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 141
LDI r2, 95
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
