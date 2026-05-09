; DESCRIPTION: Places a cyan 72x69 rectangle at position (72, 111).
; PLAN: r0=72(x), r1=111(y), r2=72(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 111
LDI r2, 72
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
