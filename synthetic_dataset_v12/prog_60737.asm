; DESCRIPTION: Places a red 120x59 rectangle at position (358, 32).
; PLAN: r0=358(x), r1=32(y), r2=120(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 32
LDI r2, 120
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
