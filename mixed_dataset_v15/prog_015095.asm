; DESCRIPTION: Places a white 40x95 rectangle at position (181, 38).
; PLAN: r0=181(x), r1=38(y), r2=40(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 38
LDI r2, 40
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
