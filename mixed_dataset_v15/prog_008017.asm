; DESCRIPTION: Places a red 93x22 rectangle at position (221, 202).
; PLAN: r0=221(x), r1=202(y), r2=93(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 202
LDI r2, 93
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
