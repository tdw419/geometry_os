; DESCRIPTION: Places a white 47x24 rectangle at position (280, 180).
; PLAN: r0=280(x), r1=180(y), r2=47(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 180
LDI r2, 47
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
