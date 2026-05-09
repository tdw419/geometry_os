; DESCRIPTION: Places a white 37x18 rectangle at position (303, 86).
; PLAN: r0=303(x), r1=86(y), r2=37(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 86
LDI r2, 37
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
