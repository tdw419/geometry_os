; DESCRIPTION: Places a black 113x46 rectangle at position (269, 93).
; PLAN: r0=269(x), r1=93(y), r2=113(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 93
LDI r2, 113
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
