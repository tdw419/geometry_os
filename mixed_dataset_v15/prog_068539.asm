; DESCRIPTION: Places a cyan 59x38 rectangle at position (189, 109).
; PLAN: r0=189(x), r1=109(y), r2=59(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 109
LDI r2, 59
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
