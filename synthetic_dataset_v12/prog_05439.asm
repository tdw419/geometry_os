; DESCRIPTION: Places a white 34x30 rectangle at position (259, 50).
; PLAN: r0=259(x), r1=50(y), r2=34(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 50
LDI r2, 34
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
