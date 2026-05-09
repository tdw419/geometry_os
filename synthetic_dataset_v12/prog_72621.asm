; DESCRIPTION: Places a white 21x39 rectangle at position (27, 90).
; PLAN: r0=27(x), r1=90(y), r2=21(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 90
LDI r2, 21
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
