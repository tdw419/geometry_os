; DESCRIPTION: Places a black 95x60 rectangle at position (358, 171).
; PLAN: r0=358(x), r1=171(y), r2=95(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 171
LDI r2, 95
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
