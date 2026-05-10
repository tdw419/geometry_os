; DESCRIPTION: Places a blue 50x61 box at position (135, 111).
; PLAN: r0=135(x), r1=111(y), r2=50(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 111
LDI r2, 50
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
