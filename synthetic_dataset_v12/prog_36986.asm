; DESCRIPTION: Places a white 71x62 rectangle at position (9, 21).
; PLAN: r0=9(x), r1=21(y), r2=71(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 21
LDI r2, 71
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
