; DESCRIPTION: Places a white 40x38 rectangle at position (416, 157).
; PLAN: r0=416(x), r1=157(y), r2=40(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 157
LDI r2, 40
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
