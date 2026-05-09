; DESCRIPTION: Places a green 34x38 rectangle at position (2, 28).
; PLAN: r0=2(x), r1=28(y), r2=34(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 28
LDI r2, 34
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
