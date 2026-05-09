; DESCRIPTION: Places a purple 27x93 rectangle at position (109, 33).
; PLAN: r0=109(x), r1=33(y), r2=27(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 33
LDI r2, 27
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
