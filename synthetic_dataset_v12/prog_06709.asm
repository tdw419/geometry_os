; DESCRIPTION: Places a white 47x21 rectangle at position (446, 73).
; PLAN: r0=446(x), r1=73(y), r2=47(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 73
LDI r2, 47
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
