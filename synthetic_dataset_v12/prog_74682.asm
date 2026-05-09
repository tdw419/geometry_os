; DESCRIPTION: Places a white 113x24 rectangle at position (196, 0).
; PLAN: r0=196(x), r1=0(y), r2=113(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 0
LDI r2, 113
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
