; DESCRIPTION: Places a purple 82x61 rectangle at position (168, 92).
; PLAN: r0=168(x), r1=92(y), r2=82(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 92
LDI r2, 82
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
