; DESCRIPTION: Places a cyan 59x38 rectangle at position (11, 184).
; PLAN: r0=11(x), r1=184(y), r2=59(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 184
LDI r2, 59
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
