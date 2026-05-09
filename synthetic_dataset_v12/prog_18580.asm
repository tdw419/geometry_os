; DESCRIPTION: Places a purple 33x102 rectangle at position (46, 111).
; PLAN: r0=46(x), r1=111(y), r2=33(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 111
LDI r2, 33
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
