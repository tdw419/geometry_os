; DESCRIPTION: Places a magenta 70x61 rectangle at position (369, 111).
; PLAN: r0=369(x), r1=111(y), r2=70(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 111
LDI r2, 70
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
