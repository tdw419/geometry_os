; DESCRIPTION: Places a white 59x71 box at position (196, 34).
; PLAN: r0=196(x), r1=34(y), r2=59(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 34
LDI r2, 59
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
