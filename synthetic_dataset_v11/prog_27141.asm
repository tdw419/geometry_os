; DESCRIPTION: Places a white 30x97 rectangle at position (160, 38).
; PLAN: r0=160(x), r1=38(y), r2=30(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 38
LDI r2, 30
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
