; DESCRIPTION: Places a white 34x43 rectangle at position (21, 199).
; PLAN: r0=21(x), r1=199(y), r2=34(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 199
LDI r2, 34
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
