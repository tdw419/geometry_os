; DESCRIPTION: Places a black 71x14 rectangle at position (112, 186).
; PLAN: r0=112(x), r1=186(y), r2=71(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 186
LDI r2, 71
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
