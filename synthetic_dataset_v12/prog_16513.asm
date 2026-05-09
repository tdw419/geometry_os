; DESCRIPTION: Places a red 92x117 rectangle at position (112, 57).
; PLAN: r0=112(x), r1=57(y), r2=92(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 57
LDI r2, 92
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
