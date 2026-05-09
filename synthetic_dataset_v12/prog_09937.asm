; DESCRIPTION: Places a cyan 107x90 rectangle at position (118, 36).
; PLAN: r0=118(x), r1=36(y), r2=107(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 36
LDI r2, 107
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
