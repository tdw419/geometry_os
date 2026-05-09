; DESCRIPTION: Places a white 24x32 rectangle at position (486, 166).
; PLAN: r0=486(x), r1=166(y), r2=24(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 166
LDI r2, 24
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
