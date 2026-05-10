; DESCRIPTION: Places a green 25x67 rectangle at position (285, 107).
; PLAN: r0=285(x), r1=107(y), r2=25(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 107
LDI r2, 25
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
