; DESCRIPTION: Creates a white filled rectangle of size 107x90 starting at (62, 173).
; PLAN: r0=62(x), r1=173(y), r2=107(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 173
LDI r2, 107
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
