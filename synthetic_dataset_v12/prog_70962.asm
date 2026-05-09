; DESCRIPTION: Places a white 50x52 rectangle at position (252, 188).
; PLAN: r0=252(x), r1=188(y), r2=50(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 188
LDI r2, 50
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
