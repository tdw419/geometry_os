; DESCRIPTION: Places a white 98x20 rectangle at position (30, 167).
; PLAN: r0=30(x), r1=167(y), r2=98(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 167
LDI r2, 98
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
