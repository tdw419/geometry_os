; DESCRIPTION: Places a white 51x42 box at position (120, 148).
; PLAN: r0=120(x), r1=148(y), r2=51(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 148
LDI r2, 51
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
