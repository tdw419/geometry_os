; DESCRIPTION: Places a red 14x120 rectangle at position (213, 36).
; PLAN: r0=213(x), r1=36(y), r2=14(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 36
LDI r2, 14
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
