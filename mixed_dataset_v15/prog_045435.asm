; DESCRIPTION: Places a white 102x52 rectangle at position (245, 13).
; PLAN: r0=245(x), r1=13(y), r2=102(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 13
LDI r2, 102
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
