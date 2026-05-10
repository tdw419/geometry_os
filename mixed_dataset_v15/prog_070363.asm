; DESCRIPTION: Places a white 23x24 rectangle at position (249, 180).
; PLAN: r0=249(x), r1=180(y), r2=23(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 180
LDI r2, 23
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
