; DESCRIPTION: Places a white 75x106 rectangle at position (140, 16).
; PLAN: r0=140(x), r1=16(y), r2=75(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 16
LDI r2, 75
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
