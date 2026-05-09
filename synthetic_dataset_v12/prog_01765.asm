; DESCRIPTION: Places a red 111x108 rectangle at position (323, 93).
; PLAN: r0=323(x), r1=93(y), r2=111(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 93
LDI r2, 111
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
