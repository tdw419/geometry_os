; DESCRIPTION: Places a green 58x66 rectangle at position (284, 106).
; PLAN: r0=284(x), r1=106(y), r2=58(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 106
LDI r2, 58
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
