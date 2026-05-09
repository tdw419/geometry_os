; DESCRIPTION: Places a cyan 13x38 rectangle at position (324, 153).
; PLAN: r0=324(x), r1=153(y), r2=13(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 153
LDI r2, 13
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
