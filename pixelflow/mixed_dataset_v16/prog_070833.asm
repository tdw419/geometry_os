; DESCRIPTION: Places a red 107x92 rectangle at position (175, 14).
; PLAN: r0=175(x), r1=14(y), r2=107(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 14
LDI r2, 107
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
