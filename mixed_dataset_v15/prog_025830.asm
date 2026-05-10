; DESCRIPTION: Places a purple 39x21 rectangle at position (42, 21).
; PLAN: r0=42(x), r1=21(y), r2=39(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 21
LDI r2, 39
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
