; DESCRIPTION: Places a white 54x96 rectangle at position (90, 6).
; PLAN: r0=90(x), r1=6(y), r2=54(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 6
LDI r2, 54
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
