; DESCRIPTION: Places a white 90x52 rectangle at position (204, 91).
; PLAN: r0=204(x), r1=91(y), r2=90(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 91
LDI r2, 90
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
