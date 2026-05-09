; DESCRIPTION: Places a yellow 39x54 rectangle at position (183, 111).
; PLAN: r0=183(x), r1=111(y), r2=39(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 111
LDI r2, 39
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
