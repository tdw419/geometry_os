; DESCRIPTION: Places a black 61x36 rectangle at position (150, 180).
; PLAN: r0=150(x), r1=180(y), r2=61(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 180
LDI r2, 61
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
