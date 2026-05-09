; DESCRIPTION: Places a white 91x15 rectangle at position (71, 200).
; PLAN: r0=71(x), r1=200(y), r2=91(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 200
LDI r2, 91
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
