; DESCRIPTION: Places a red 93x36 rectangle at position (35, 210).
; PLAN: r0=35(x), r1=210(y), r2=93(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 210
LDI r2, 93
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
