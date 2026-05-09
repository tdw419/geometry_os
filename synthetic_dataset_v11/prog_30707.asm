; DESCRIPTION: Places a white 13x48 rectangle at position (230, 27).
; PLAN: r0=230(x), r1=27(y), r2=13(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 27
LDI r2, 13
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
