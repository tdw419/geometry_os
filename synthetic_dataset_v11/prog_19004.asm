; DESCRIPTION: Places a cyan 30x12 rectangle at position (34, 29).
; PLAN: r0=34(x), r1=29(y), r2=30(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 29
LDI r2, 30
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
