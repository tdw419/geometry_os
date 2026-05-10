; DESCRIPTION: Places a white 28x23 rectangle at position (363, 38).
; PLAN: r0=363(x), r1=38(y), r2=28(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 38
LDI r2, 28
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
