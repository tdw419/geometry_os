; DESCRIPTION: Places a white 59x111 rectangle at position (8, 51).
; PLAN: r0=8(x), r1=51(y), r2=59(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 51
LDI r2, 59
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
