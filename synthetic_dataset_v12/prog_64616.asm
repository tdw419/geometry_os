; DESCRIPTION: Places a green 93x90 rectangle at position (122, 21).
; PLAN: r0=122(x), r1=21(y), r2=93(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 21
LDI r2, 93
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
