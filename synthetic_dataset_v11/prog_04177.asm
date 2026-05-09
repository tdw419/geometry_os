; DESCRIPTION: Places a green 38x38 rectangle at position (90, 30).
; PLAN: r0=90(x), r1=30(y), r2=38(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 30
LDI r2, 38
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
