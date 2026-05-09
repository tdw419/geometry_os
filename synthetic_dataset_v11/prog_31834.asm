; DESCRIPTION: Places a white 28x70 rectangle at position (144, 111).
; PLAN: r0=144(x), r1=111(y), r2=28(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 111
LDI r2, 28
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
