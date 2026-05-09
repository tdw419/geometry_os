; DESCRIPTION: Places a orange 31x30 rectangle at position (412, 192).
; PLAN: r0=412(x), r1=192(y), r2=31(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 192
LDI r2, 31
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
