; DESCRIPTION: Places a yellow 93x36 rectangle at position (299, 24).
; PLAN: r0=299(x), r1=24(y), r2=93(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 24
LDI r2, 93
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
