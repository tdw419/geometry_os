; DESCRIPTION: Places a white 51x64 rectangle at position (74, 92).
; PLAN: r0=74(x), r1=92(y), r2=51(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 92
LDI r2, 51
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
