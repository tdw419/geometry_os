; DESCRIPTION: Places a red 20x88 rectangle at position (81, 111).
; PLAN: r0=81(x), r1=111(y), r2=20(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 111
LDI r2, 20
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
