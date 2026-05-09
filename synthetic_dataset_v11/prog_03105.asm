; DESCRIPTION: Places a yellow 52x103 rectangle at position (129, 146).
; PLAN: r0=129(x), r1=146(y), r2=52(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 146
LDI r2, 52
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
