; DESCRIPTION: Places a cyan 77x103 rectangle at position (262, 130).
; PLAN: r0=262(x), r1=130(y), r2=77(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 130
LDI r2, 77
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
