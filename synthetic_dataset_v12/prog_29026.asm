; DESCRIPTION: Places a blue 51x109 rectangle at position (42, 83).
; PLAN: r0=42(x), r1=83(y), r2=51(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 83
LDI r2, 51
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
