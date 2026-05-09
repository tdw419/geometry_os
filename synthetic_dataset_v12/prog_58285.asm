; DESCRIPTION: Places a red 107x61 rectangle at position (231, 17).
; PLAN: r0=231(x), r1=17(y), r2=107(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 17
LDI r2, 107
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
