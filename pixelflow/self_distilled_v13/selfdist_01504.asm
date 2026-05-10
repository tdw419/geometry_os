; DESCRIPTION: Places a green 30x50 box at position (259, 124).
; PLAN: r0=259(x), r1=124(y), r2=30(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 124
LDI r2, 30
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
