; DESCRIPTION: Places a red 83x94 rectangle at position (245, 118).
; PLAN: r0=245(x), r1=118(y), r2=83(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 118
LDI r2, 83
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
