; DESCRIPTION: Places a white 28x95 rectangle at position (338, 139).
; PLAN: r0=338(x), r1=139(y), r2=28(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 139
LDI r2, 28
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
