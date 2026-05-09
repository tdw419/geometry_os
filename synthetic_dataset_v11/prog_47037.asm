; DESCRIPTION: Places a yellow 30x28 rectangle at position (168, 172).
; PLAN: r0=168(x), r1=172(y), r2=30(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 172
LDI r2, 30
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
