; DESCRIPTION: Places a white 51x63 rectangle at position (64, 187).
; PLAN: r0=64(x), r1=187(y), r2=51(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 187
LDI r2, 51
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
