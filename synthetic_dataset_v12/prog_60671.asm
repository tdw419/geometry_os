; DESCRIPTION: Places a green 82x20 rectangle at position (53, 51).
; PLAN: r0=53(x), r1=51(y), r2=82(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 51
LDI r2, 82
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
