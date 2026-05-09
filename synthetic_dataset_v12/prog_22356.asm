; DESCRIPTION: Places a green 77x10 rectangle at position (333, 111).
; PLAN: r0=333(x), r1=111(y), r2=77(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 111
LDI r2, 77
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
