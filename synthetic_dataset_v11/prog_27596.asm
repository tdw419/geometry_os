; DESCRIPTION: Places a black 103x40 rectangle at position (21, 111).
; PLAN: r0=21(x), r1=111(y), r2=103(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 111
LDI r2, 103
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
