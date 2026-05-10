; DESCRIPTION: Places a white 37x47 rectangle at position (465, 183).
; PLAN: r0=465(x), r1=183(y), r2=37(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 183
LDI r2, 37
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
