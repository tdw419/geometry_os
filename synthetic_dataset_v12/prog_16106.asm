; DESCRIPTION: Places a yellow 102x73 rectangle at position (168, 159).
; PLAN: r0=168(x), r1=159(y), r2=102(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 159
LDI r2, 102
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
