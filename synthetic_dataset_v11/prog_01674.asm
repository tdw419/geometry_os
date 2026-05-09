; DESCRIPTION: Places a cyan 102x91 rectangle at position (123, 111).
; PLAN: r0=123(x), r1=111(y), r2=102(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 111
LDI r2, 102
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
