; DESCRIPTION: Places a yellow 118x47 rectangle at position (92, 114).
; PLAN: r0=92(x), r1=114(y), r2=118(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 114
LDI r2, 118
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
