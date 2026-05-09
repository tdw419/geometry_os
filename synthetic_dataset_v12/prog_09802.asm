; DESCRIPTION: Places a white 28x27 rectangle at position (449, 188).
; PLAN: r0=449(x), r1=188(y), r2=28(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 188
LDI r2, 28
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
