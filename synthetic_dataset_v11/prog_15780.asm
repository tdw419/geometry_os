; DESCRIPTION: Places a red 120x97 rectangle at position (102, 21).
; PLAN: r0=102(x), r1=21(y), r2=120(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 21
LDI r2, 120
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
