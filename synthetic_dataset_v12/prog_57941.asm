; DESCRIPTION: Places a white 34x25 rectangle at position (417, 86).
; PLAN: r0=417(x), r1=86(y), r2=34(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 86
LDI r2, 34
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
