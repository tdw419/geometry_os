; DESCRIPTION: Places a white 50x51 rectangle at position (238, 187).
; PLAN: r0=238(x), r1=187(y), r2=50(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 187
LDI r2, 50
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
