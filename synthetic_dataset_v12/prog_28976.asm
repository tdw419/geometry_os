; DESCRIPTION: Places a green 16x72 rectangle at position (18, 111).
; PLAN: r0=18(x), r1=111(y), r2=16(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 111
LDI r2, 16
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
