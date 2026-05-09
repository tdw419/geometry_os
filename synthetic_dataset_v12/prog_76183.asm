; DESCRIPTION: Places a yellow 33x103 rectangle at position (223, 42).
; PLAN: r0=223(x), r1=42(y), r2=33(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 42
LDI r2, 33
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
