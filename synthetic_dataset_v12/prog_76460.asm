; DESCRIPTION: Places a yellow 111x51 rectangle at position (85, 42).
; PLAN: r0=85(x), r1=42(y), r2=111(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 42
LDI r2, 111
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
