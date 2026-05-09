; DESCRIPTION: Places a black 12x43 rectangle at position (243, 93).
; PLAN: r0=243(x), r1=93(y), r2=12(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 93
LDI r2, 12
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
