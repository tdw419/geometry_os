; DESCRIPTION: Places a white 84x108 rectangle at position (394, 120).
; PLAN: r0=394(x), r1=120(y), r2=84(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 120
LDI r2, 84
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
