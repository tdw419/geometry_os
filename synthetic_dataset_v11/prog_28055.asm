; DESCRIPTION: Places a yellow 77x87 rectangle at position (21, 103).
; PLAN: r0=21(x), r1=103(y), r2=77(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 103
LDI r2, 77
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
