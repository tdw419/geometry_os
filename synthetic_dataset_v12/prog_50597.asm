; DESCRIPTION: Places a red 120x11 rectangle at position (221, 191).
; PLAN: r0=221(x), r1=191(y), r2=120(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 191
LDI r2, 120
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
