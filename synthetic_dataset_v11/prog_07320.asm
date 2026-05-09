; DESCRIPTION: Places a green 104x109 rectangle at position (91, 111).
; PLAN: r0=91(x), r1=111(y), r2=104(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 111
LDI r2, 104
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
