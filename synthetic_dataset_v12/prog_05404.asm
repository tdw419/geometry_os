; DESCRIPTION: Places a white 65x47 rectangle at position (417, 170).
; PLAN: r0=417(x), r1=170(y), r2=65(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 170
LDI r2, 65
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
