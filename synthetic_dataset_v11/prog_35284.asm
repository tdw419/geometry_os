; DESCRIPTION: Places a red 74x102 rectangle at position (142, 111).
; PLAN: r0=142(x), r1=111(y), r2=74(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 111
LDI r2, 74
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
